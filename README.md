# racket_CSharp_lexer

## What is this?
This code is a Racket program that defines several functions to highlight the syntax of a C# source code file and 
generate an HTML file with the source code highlighted. The code works by reading a plain text file containing C# 
source code and then applying different regular expressions to the text string to highlight different syntactic elements.

### The code defines functions to highlight the following syntactic elements:

* **Character literals** - Characters enclosed in single quotes ('') that represent an ASCII character.
* **Comments** – Text used to document or explain source code that fails to compile or run. In C#, comments can be single line (//) or multiline (/* */).
* **Integer Literals** – Integers in C# that can be in decimal, hexadecimal, or binary notation.
* **Keywords** – Words that have special meaning in C# and are used to define control flow structures, data types, etc.
* **Operators** – Symbols used to perform mathematical or logical operations, compare values, etc.
* **Real Literals** – Real literals are used to write values of types float, double, and decimal.
* **String Literals** – A sequence of characters from the source character set enclosed in double quotation marks (" ").

## How do I run it?
To run you must execute the `main.rkt` file, it takes the `input.txt` file as input and returns a `main.html` file as output.
<br> In case you want the output file with another name, you must change the name of the file in the following line: 
  <br> `(define output-port (open-output-file **"YOUR NAME.html"** #:exists 'replace))`. You can find this line in the `main.rkt` almost to the end of the file.

---

## Authors
* **Daniel Sebastián Cajas Morales** - [DanielSebasCM](https://github.com/DanielSebasCM) :ecuador: :toolbox:
* **Daniel Emilio Fuentes Portaluppi** - [danfupo03](https://github.com/danfupo03) :mexico: :shipit:
