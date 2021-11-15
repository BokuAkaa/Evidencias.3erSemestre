# Detect English module
# https://www.nostarch.com/crackingcodes (BSD Licensed)

# To use, type this code:
#   import detectEnglish
#   detectEnglish.isEnglish(someString) # returns True or False
# (There must be a "dictionary.txt" file in this directory with all English
# words in it, one word per line. You can download this from
# https://invpy.com/dictionary.txt)
UPPERLETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' #Agregar Ñ, acentos y diéresis
LETTERS_AND_SPACE = UPPERLETTERS + UPPERLETTERS.lower() + ' \t\n'

def loadDictionary():
    dictionaryFile = open('diccionario.txt', encoding='utf-8')
    #dictionaryFile = open('dictEsp.txt')
    englishWords = {}
    for word in dictionaryFile.read().split('\n'):
        englishWords[word] = None
    dictionaryFile.close()
    return englishWords

ENGLISH_WORDS = loadDictionary()


def getEnglishCount(mensaje):
    message = mensaje.upper()
    message = removeNonLetters(mensaje)
    possibleWords = mensaje.split()

    if possibleWords == []:
        return 0.0 # No words at all, so return 0.0.

    matches = 0
    for word in possibleWords:
        if word in ENGLISH_WORDS:
            matches += 1
    return float(matches) / len(possibleWords)


def removeNonLetters(message):
    lettersOnly = []
    for symbol in message:
        if symbol in LETTERS_AND_SPACE:
            lettersOnly.append(symbol)
    return ''.join(lettersOnly)


def isEnglish(mensaje, wordPercentage=20, letterPercentage=85):
    # By default, 20% of the words must exist in the dictionary file, and
    # 85% of all the characters in the message must be letters or spaces
    # (not punctuation or numbers).
    wordsMatch = getEnglishCount(mensaje) * 100 >= wordPercentage
    numLetters = len(removeNonLetters(mensaje))
    messageLettersPercentage = float(numLetters) / len(mensaje) * 100
    lettersMatch = messageLettersPercentage >= letterPercentage
    return wordsMatch and lettersMatch
