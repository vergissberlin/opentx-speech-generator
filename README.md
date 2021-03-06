# OpenTX speech generator

Multilingual speech file generation for *[OpenTX](http://www.open-tx.org)* transmitter 
like the *[Turnigy 9XR](https://hobbyking.com/de_de/turnigy-9xr-transmitter-mode-2-no-module.html)* 
or *[Taranis](https://www.frsky-rc.com/product-category/transmitters/)* using the macOS program *say*.
           
[![Demonstration](https://img.youtube.com/vi/gTEkSz8f-N4/0.jpg)](https://www.youtube.com/watch?v=gTEkSz8f-N4)

[![asciicast](https://asciinema.org/a/YazEAdRJXgSmsxvVBZbSVb5rg.png)](https://asciinema.org/a/YazEAdRJXgSmsxvVBZbSVb5rg)

## Dependencies

- **On your mac**
  - macOS > 10.9
  - sox
- **On your transmitter**
  - OpenTX > 2.2.0

## Installation

```brew install sox```

### Usage

1. Download & extract / checkout the source code
2. Open then terminal
3. change to the directory
4. run the generator script
5. Copy the generated audio files to your transmitter
6. Setup audio events for your transmitter

### Preset audios

I made uge preset for your, and translate it to a lot of other languages.
I had used the google translator for that, so feel free to leave comments in the document if something is wrong!

**Leave a comment** https://docs.google.com/spreadsheets/d/1a4PmykBNEFIXGFeczo2H2s-zHMc7_fRl1GRQbMWlAio/edit#gid=604462468


### Custom audios

If you wanna add or edit something on your own, it's easy like that:

1. Import the included ``Text2SpeeMap.csv`` in your Spreadsheet program like *Pages*, *Open Office* or *Google Drive*.
2. Add, edit, delete some rows and export it again as csv.
3. Replace the ``Text2SpeeMap.csv`` and rerun the script.


### Hints

#### Translations

With http://translate.google.com it is easy to translate hole documents!
If you add a new one, feel free to contact me! 


#### Available voices

The list of available voices you get with: ``say -v '?'``

```
Alex                en_US    # Most people recognize me by my voice.
Alice               it_IT    # Salve, mi chiamo Alice e sono una voce italiana.
Alva                sv_SE    # Hej, jag heter Alva. Jag är en svensk röst.
Amelie              fr_CA    # Bonjour, je m’appelle Amelie. Je suis une voix canadienne.
Anna                de_DE    # Hallo, ich heiße Anna und ich bin eine deutsche Stimme.
Carmit              he_IL    # שלום. קוראים לי כרמית, ואני קול בשפה העברית.
Damayanti           id_ID    # Halo, nama saya Damayanti. Saya berbahasa Indonesia.
Daniel              en_GB    # Hello, my name is Daniel. I am a British-English voice.
Diego               es_AR    # Hola, me llamo Diego y soy una voz española.
Ellen               nl_BE    # Hallo, mijn naam is Ellen. Ik ben een Belgische stem.
Fiona               en-scotland # Hello, my name is Fiona. I am a Scottish-English voice.
Fred                en_US    # I sure like being inside this fancy computer
Ioana               ro_RO    # Bună, mă cheamă Ioana . Sunt o voce românească.
Joana               pt_PT    # Olá, chamo-me Joana e dou voz ao português falado em Portugal.
Jorge               es_ES    # Hola, me llamo Jorge y soy una voz española.
Juan                es_MX    # Hola, me llamo Juan y soy una voz mexicana.
Kanya               th_TH    # สวัสดีค่ะ ดิฉันชื่อKanya
Karen               en_AU    # Hello, my name is Karen. I am an Australian-English voice.
Kyoko               ja_JP    # こんにちは、私の名前はKyokoです。日本語の音声をお届けします。
Laura               sk_SK    # Ahoj. Volám sa Laura . Som hlas v slovenskom jazyku.
Lekha               hi_IN    # नमस्कार, मेरा नाम लेखा है. मैं हिन्दी में बोलने वाली आवाज़ हूँ.
Luca                it_IT    # Salve, mi chiamo Luca e sono una voce italiana.
Luciana             pt_BR    # Olá, o meu nome é Luciana e a minha voz corresponde ao português que é falado no Brasil
Maged               ar_SA    # مرحبًا اسمي Maged. أنا عربي من السعودية.
Mariska             hu_HU    # Üdvözlöm! Mariska vagyok. Én vagyok a magyar hang.
Mei-Jia             zh_TW    # 您好，我叫美佳。我說國語。
Melina              el_GR    # Γεια σας, ονομάζομαι Melina. Είμαι μια ελληνική φωνή.
Milena              ru_RU    # Здравствуйте, меня зовут Milena. Я – русский голос системы.
Moira               en_IE    # Hello, my name is Moira. I am an Irish-English voice.
Monica              es_ES    # Hola, me llamo Monica y soy una voz española.
Nora                nb_NO    # Hei, jeg heter Nora. Jeg er en norsk stemme.
Paulina             es_MX    # Hola, me llamo Paulina y soy una voz mexicana.
Samantha            en_US    # Hello, my name is Samantha. I am an American-English voice.
Sara                da_DK    # Hej, jeg hedder Sara. Jeg er en dansk stemme.
Satu                fi_FI    # Hei, minun nimeni on Satu. Olen suomalainen ääni.
Sin-ji              zh_HK    # 您好，我叫 Sin-ji。我講廣東話。
Tessa               en_ZA    # Hello, my name is Tessa. I am a South African-English voice.
Thomas              fr_FR    # Bonjour, je m’appelle Thomas. Je suis une voix française.
Ting-Ting           zh_CN    # 您好，我叫Ting-Ting。我讲中文普通话。
Veena               en_IN    # Hello, my name is Veena. I am an Indian-English voice.
Victoria            en_US    # Isn't it nice to have a computer that will talk to you?
Xander              nl_NL    # Hallo, mijn naam is Xander. Ik ben een Nederlandse stem.
Yelda               tr_TR    # Merhaba, benim adım Yelda. Ben Türkçe bir sesim.
Yuna                ko_KR    # 안녕하세요. 제 이름은 Yuna입니다. 저는 한국어 음성입니다.
Yuri                ru_RU    # Здравствуйте, меня зовут Yuri. Я – русский голос системы.
Zosia               pl_PL    # Witaj. Mam na imię Zosia, jestem głosem kobiecym dla języka polskiego.
Zuzana              cs_CZ    # Dobrý den, jmenuji se Zuzana. Jsem český hlas.
```

#### Add voices

Apple has created lots of new speech synthesizer voices for Lion. It's easy to download them, but the fact that they exist isn't very-well advertised in System Preferences (or otherwise in the OS). 
Here's how to get them.

1. Open System Preferences » Speech » Text to Speech.
2. Click on the System Voice: menu and select Customize.
3. You're presented with a huge list of voices to choose from.
4. Click on a voice and press Play to preview it.
5. Check the boxes to the left of the ones you like. Then click OK.

Software Update will open and download your voices. 
Be warned, some of the files are huge. 
