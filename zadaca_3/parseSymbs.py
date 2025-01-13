def _parse_symbols(self):
    # Inicijalizacija predefiniranih oznaka.
    self._init_symbols()
    
    self._variables = {}
    self._num_vars = 16
    
    self._iter_lines(self._parse_labels)
    self._iter_lines(self._parse_variables)

# Svaka oznaka mora biti sadrzana unutar oblih zagrada. Npr. "(LOOP)". Svaka
# oznaka koju procitamo treba zapamtiti broj linije u kojoj se nalazi i biti
# izbrisana iz nje. Koristimo dictionary _labels.
def _parse_labels(self, line, p, o):
    if line.startswith('(') and line.endswith(')'):
        label = line[1:-1]  #dohvatimo oznaku izmđeu zagrada
        if len(label) == 0:
            self._flag = False
            self._line = o
            self._errm = "Invalid label"
        else:
            self._labels[label] = str(p)
        
        return ""
    
    else:
        return line

# Svaki poziv na varijablu ili oznaku je oblika "@NAZIV", gdje naziv nije broj.
# Prvo provjeriti oznake ("_labels"), a potom varijable ("_vars"). Varijablama
# dodjeljujemo memorijske adrese pocevsi od 16. Ova funkcija nikad ne vraca
# prazan string!
def _parse_variables(self, line, p, o):
    if not line.startswith('@'):
        return line
    
    l = line[1:]
    
    if l.isdigit():
        return line
    
    if l in self._labels:
        return '@' + self._labels[l]
    
    if l not in self._variables:
        self._variables[l] = str(self._num_vars)
    
    return '@' + self._variables[l]

# Inicijalizacija predefiniranih oznaka.
def _init_symbols(self):
    self._labels = {
        "SCREEN" : "16384",
        "KBD" : "24576",
        "SP" : "0",
        "LCL" : "1",
        "ARG" : "2",
        "THIS" : "3",
        "THAT" : "4"
    }
    
    for i in range(0, 16):
        self._labels["R" + str(i)] = str(i)
