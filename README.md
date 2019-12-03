# exFAT extra long file path

## Version

Date        | Author                  | Contact               | Version | Comment
---         | ---                     | ---                   | ---     | ---
23/10/2019  | noraj (Alexandre ZANNI) | noraj#0833 on discord | 1.0     | Document creation

## Information

Information displayed for CTF players:

+ **Name of the challenge** / **Nom du challenge**: `The long way`
+ **Category** / **Catégorie**: `Misc`
+ **Internet**: not needed
+ **Difficulty** / **Difficulté**: easy / facile

### Description

```
You need to go deeper...
But when you'll be deep the dark will surround you...

Flag format: sigsegv{flag}

author: [noraj](https://pwn.by/noraj/)
```

### Hints

- Hint1: It's a scripting challenge right?
- Hint2: exFAT
- Hint3: buffer

## Integration

Just share the `.img` file.

## Solving

### Author solution

1. Identify the file system type of the `.img`: exFAT
2. Mount it
3. See there is a folder in a folder in a folder...
4. See that all folders are numbers: int (hex) -> str (chr) gives a valid ASCII value
5. Retrieve the complete path and transform it to ASCII text

In order to accomplish step 5 you will need to script because the path is way too long,
so `ls` or general library filesystem helpers can't handle it. You have to take
a bufferized approach.

`solve.sh` is automating steps 1. to 5.

## Flag

`sigsegv{noooo0000000oooo0000000000oooooooo000000000000000ooooooOOOOOOOOOOOOOOOOo_liimit!}`

## SigSegV2

A misc challenge that was available during SigSegV2 CTF (2019).

20 teams on 36 flaged this challenge.