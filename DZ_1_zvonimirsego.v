Set Implicit Arguments.
Require Import List.
Import ListNotations.
Require Import Lia.
Require Import Bool.

(* Tu se nalaze zadatci 1. i 4. *)

(* 1 *)
(* a) *)

Goal forall (x y : bool),
  (x && (negb y)) || ((negb x) && (negb y)) || ((negb x) && y) = negb (x && y).
Proof.
  intros. destruct x, y ; reflexivity.
Qed.

(* b) *)

Goal forall (x y z : bool),
  negb ((negb x) && y && z) && negb (x && y && (negb z)) && (x && (negb y) && z) = x && (negb y) && z.
Proof.
  intros. destruct x, y, z ; reflexivity.
Qed.

(* Bit *)

Inductive B : Type :=
  | O : B
  | I : B.

Definition And (x y : B) : B :=
match x with
  | O => O
  | I => y
end.

Definition Or (x y : B) : B :=
match x with
  | O => y
  | I => I
end.

Definition Not (x : B) : B :=
match x with
  | O => I
  | I => O
end.

Definition Add (x y c : B) : B :=
match x, y with
  | O, O => c
  | I, I => c
  | _, _ => Not c
end.

Definition Rem (x y c : B) : B :=
match x, y with
  | O, O => O
  | I, I => I
  | _, _ => c
end.

(* List *)

Fixpoint AndL (x y : list B) : list B :=
match x, y with
| [], _ => []
| _, [] => []
| x :: xs, y :: ys => And x y :: AndL xs ys
end.

Fixpoint OrL (x y : list B) : list B :=
match x, y with
| [], _ => []
| _, [] => []
| x :: xs, y :: ys => Or x y :: OrL xs ys
end.

Fixpoint NotL (x : list B) : list B :=
match x with
  | [] => []
  | x :: xs => Not x :: NotL xs
end.

Fixpoint AddLr (x y : list B) (c : B) : list B :=
match x, y with
| [], _ => []
| _, [] => []
| x :: xs, y :: ys => Add x y c :: AddLr xs ys (Rem x y c)
end.

Definition AddL (x y : list B) : list B := rev (AddLr (rev x) (rev y) O).

Fixpoint IncLr (x : list B) (c : B) : list B :=
match x with
| [] => []
| x :: xs => Add x I c :: IncLr xs (Rem x I c)
end.

Definition IncL (x : list B) : list B := rev (IncLr (rev x) O).

(* ALU *)

Definition flag_zx (f : B) (x : list B) : list B :=
match f with
| I => repeat O (length x)
| O => x
end.

Definition flag_nx (f : B) (x : list B) : list B :=
match f with
| I => NotL x
| O => x
end.

Definition flag_f (f : B) (x y : list B) : list B :=
match f with
| I => AddL x y
| O => AndL x y
end.

Definition ALU (x y : list B) (zx nx zy ny f no : B) : list B := 
  flag_nx no (flag_f f (flag_nx nx (flag_zx zx x)) (flag_nx ny (flag_zx zy y))).

(* Teoremi *)

Lemma ALU_zero (x y : list B) :
  length x = length y -> ALU x y I O I O I O = repeat O (length x).
Proof. Abort.

Lemma ALU_minus_one (x y : list B) : 
  length x = length y -> ALU x y I I I O I O = repeat I (length x).
Proof. Abort.

Lemma ALU_x (x y : list B) : 
  length x = length y -> ALU x y O O I I O O = x.
Proof. Abort.

Lemma ALU_y (x y : list B) : 
  length x = length y -> ALU x y I I O O O O = y.
Proof. Abort.

Lemma ALU_Not_x (x y : list B) : 
  length x = length y -> ALU x y O O I I O I = NotL x.
Proof. Abort.

Lemma ALU_Not_y (x y : list B) : 
  length x = length y -> ALU x y I I O O O I = NotL y.
Proof. Abort.

Lemma ALU_Add (x y : list B) : 
  length x = length y -> ALU x y O O O O I O = AddL x y.
Proof. Abort.

Lemma ALU_And (x y : list B) : 
  length x = length y -> ALU x y O O O O O O = AndL x y.
Proof. Admitted.

Lemma ALU_Or (x y : list B) : 
  length x = length y -> ALU x y O I O I O I = OrL x y.
Proof. Admitted.

(* DZ *)

Lemma ALU_One (n : nat) (x y : list B) :
  length x = n /\ length y = n /\ n <> 0 -> ALU x y I I I I I I = repeat O (pred n) ++ [I].
Proof.
intros [H1 [H2 H3]]. assert(G: length x = length y).
{
  now rewrite H1, H2.
}
simpl. assert(F: forall m, NotL (repeat O m) = repeat I m).
{
  induction m. 
  - simpl. reflexivity.
  - simpl. now rewrite IHm.
}
rewrite ! F, <- G, H1. unfold AddL.
assert(D: forall m, repeat I m ++ [I] = I :: repeat I m).
{
  induction m.
  - reflexivity.
  - simpl. now rewrite IHm.
}
assert(E: forall m, rev (repeat I m) = repeat I m).
{
  induction m.
  - reflexivity.
  - simpl. rewrite IHm. now rewrite D. 
}
rewrite ! E. 
assert(C: forall m, AddLr (repeat I m) (repeat I m) I  = repeat I m).
{
  induction m.
  - reflexivity.
  - simpl. now rewrite IHm.
}
assert(B: forall m, m <> 0 -> AddLr (repeat I m) (repeat I m) O = [O] ++ repeat I (Nat.pred m)).
{
  destruct m.
  - now intros. 
  - intros. simpl. f_equal. now rewrite C.
}
rewrite ! B. simpl. rewrite E.
assert(A: forall m, NotL (repeat I m ++ [O]) = repeat O m ++ [I]).
{
  induction m.
  - reflexivity.
  - simpl. now rewrite IHm.
}
now rewrite A. apply H3.
Qed.







