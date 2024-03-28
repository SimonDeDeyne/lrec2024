experiment = c(); filepath = c()

release = '20240301'
filepath$pairs = '../data/Bolognesi2017/Bologinesi2017.stimuli.csv'
filepath$instructions = '../data/Bolognesi2017/Bolognesi2017.instructions.txt'
filepath$outputfile = paste0('../output/raw/Bolognesi2017.gpt4.',release,'.rds')

codes = c('E-beh', 'E-comp', 'E-perc', 'E-sys', 'E-whol', 
          'E_-comp', 'I-cont', 'I-emo', 'I-eval', 'S-act', 
          'S-fun', 'S-loc', 'S-obj', 'S-other', 'S-par', 
          'S-time', 'T-ant', 'T-coor', 'T-sub', 'T-sup', 'T-syn')

experiment = c(
  name = 'Bolognesi 2017 Features',
  release = release,
  codes = codes,
  filepath = filepath,
  setSize = 100, # number of stimuli per prompt
  gpt_temperature = 0,
  gpt_model = "gpt-4-0613"
)
