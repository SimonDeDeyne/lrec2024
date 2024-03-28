experiment = c(); filepath = c()

release = '20240228'
filepath$pairs = '../data/Vivas2022/Vivas2022.stimuli.csv'
filepath$instructions = '../data/Vivas2022/Vivas2022.instructions.asso.txt'
filepath$outputfile = paste0('../output/raw/Vivas2022.asso.gpt4.',release,'.rds')

codes = c('I-EMOT', 'S-FUNC', 'S-EVENT', 'S-SOCART', 'E-EXCOMP', 
          'T-SUPER', 'E-SYS', 'S-LOC', 'E-BEH', 'E-EXSURF', 'E-INCOMP', 
          'S-TIME', 'I-EVAL', 'S-PERSON', 'E-MAT', 'E-QUANT', 'S-OBJECT', 
          'S-ACTION', 'T-SUBORD', 'T-SYN', 'E-WHOLE', 'E-INSURF', 'I-REP', 
          'S-LIVING', 'E-ABSTR', 'S-BUILD', 'T-COORD', 'I-CONTIN', 'S-SPAT', 
          'T-ONT', 'S-SOCORG', 'S-PHYST', 'I-NEG','T-INDIV')


experiment = c(
  name = 'Vivas 2022 Associations',
  codes = codes,
  release = release,
  filepath = filepath,
  setSize = 100, # number of stimuli per prompt
  gpt_temperature = 0,
  gpt_model = "gpt-4-0613"
)

