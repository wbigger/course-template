<style>
.centered {
	text-align: center;
}

img {
  width: 20%;
}

img.right_side {
  float: right;
  margin:5px 5px 0px 20px;
  width: 30%;
}
img.left_side {
  float:left;
  margin:5px 20px 0px 5px;
  width: 20%;
}

p.clear {
  clear: both;  
}
p.img-container {
  margin-bottom: 15px;
}

p.img-container::after {
  margin-bottom: 15px;
  overflow: hidden;
  clear: both;
}
</style>

# CSS

<p class="img-container">
L'HTML è fin da subito nato come uno standard aperto: questo all'inizio ha creato delle difficoltà, ma con il passare del tempo si è rivelato un aspetto vincente.

<img class="right_side" title="CSS logo" alt="CSS logo" src="assets/css-logo.png" width="15%">

</p>

La definizione del CSS è un tipico esempio di quanto detto. Nei primi anni di diffusione (1993-1996) le diverse aziende concorrenti che hanno creato i primi browser (Netscape e Internet Explorer in particolare) crearono delle estensioni proprietarie dell'HTML con l'aggiunta di confusione e difficoltà per gli sviluppatori. Il w3c decise quindi di affrontare questo problema creando un gruppo di lavoro che produsse uno standard nel 1996 chiamato Cascading Style Sheet (CSS).

Questa divisione si rivelò estremamente efficace per risolvere i problemi che si sono posti con il passare degli anni. In particolare, riuscì in modo eccellente a risolvere il problema della diversa dimensione degli schermi dei palmari prima e degli smartphone poi.

Oggi CSS include moltissime funzionalità che permettono l'animazione degli elementi nelle pagine, le trasformazioni (es. rotazione, scalatura), i gradienti e molte altre cose.

# Concetti base

## Selettori
Il CSS si basa su questi due passaggi:
1. selezionare gli elementi a cui si vuole applicare un certo stile
2. dichiarare le proprietà da applicare a quegli elementi.

<p class="centered">
<img style="width:85%; margin:15px 0" title="CSS selector" alt="CSS selector" src="assets/css-selector.gif" >
</p>

I selettori di base sono di 3 tipi:
- tag: non hanno nessun prefisso, selezionano tutti gli elementi con il tag selezionato. Ad esempio `div {background-color:red}` colora di rosso lo sfondo di tutti gli elementi con il tag div
- id: ha come prefisso `#` (cancelletto), seleziona l'elemento che ha come attributo id il valore specificato. Ad esempio `#my-title {font-weight:bold}` rende grassetto l'elemento che ha come attributo `id="my-title"`
- class: ha come prefisso `.` (punto), seleziona tutti gli elementi che hanno come attributo il valore specificato. Ad esempio `.small-images {width=5%}` imposta la larghezza di tutti gli elementi che hanno come attributo `class="small-images` al 5% della larghezza dello schermo.

## Box model
Un altro concetto fondamentale del CSS è che la pagina è come se fosse uno scaffale, in cui ogni elemento è una scatola (_box_). La scatola è composta dalla confezione (_border_), al cui interno c'è un contenuto (_content_) protetto dall'imballaggio (_padding_). Le scatole sono distanziate l'una dall'altra da un margine di spazio (_margin_).

<p class="centered">
<img style="width:85%; margin:15px 0" title="CSS box model" alt="CSS box model" src="assets/css-box-model.jpg" >
</p>

Ricapitolando, la nomenclatura del box-model utilizzato da CSS è:
- box: ogni elemento della nostra pagina
- content: il contenuto vero e proprio, ad esempio il testo, l'immagine o altri elementi annidati
- padding: l'imballaggio, sta all'interno della nostra scatola, quindi coprirà anche l'eventuale colore o immagine di sfondo
- border: la confezione, ovvero il rettangolo che include padding e contenuto
- margin: il margine tra una scatola e l'altra

Fate attenzione che i margini tra due elementi si sommano: quindi se un elemento ha margine destro pari a 10px, e il successivo ha margine sinistro pari a 15px, il margine totale sarà 25px.
