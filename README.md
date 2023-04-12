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

Each function defines a regular expression that looks for a pattern in the source code and then uses the `regexp-replace*` 
function to replace the found pattern with an HTML string that highlights the pattern.

The program also defines some helper functions that are used in regular expressions, such as `operatorSafe`, 
which wraps an operator in an HTML tag to prevent operators inside an HTML tag from being highlighted.

---

## Authors
* **Daniel Sebastián Cajas Morales** - [DanielSebasCM](https://github.com/DanielSebasCM) :ecuador: :bowtie:
* **Daniel Emilio Fuentes Portaluppi** - [danfupo03](https://github.com/danfupo03) :mexico: :shipit:
