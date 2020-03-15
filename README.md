# Intergalactic Converter?

## What is the project for?

The project was made to help computer programmers who are applying for positions in companies, during the interview process. However, I strongly recommend that you DO NOT COPY THIS WHOLE PROJECT, but try to use it as reference for your solution. I suggest it to you because it is important to show your recruiter how you solve problems in a smart way without doing "copy and paste".

## How to use it?

After you've cloned this project in your machine, follow the steps:
- open a terminal session in your terminal tool (Iterm, Terminal, Putty)
- go to folder where you've clone the project (Ex.: ```cd intergalactic_converter```)
- type the command: ```make run```

This command will run the container and the application. If all goes well, you will see the message:
```
-------------------------------------------------------------------------
|            Deep Thought: Intergalactic unit conversor                 |
-------------------------------------------------------------------------
Type bellow a intergalactic units (For example: glob glob Silver) and to find how many credits is it. After type, press [Enter] button in your keyboard.


Type the unit or type EXIT to close the program:
```

##### IMPORTANT!
when you run ```make run```in the first time, the docker image will be created. In the next times, docker compose will reuse the image.

# Extra tools

* If you want to run automated testing, open a new terminal session in your machine, go to the project folder and type the command ```make test```.
* If you want to enter in the container in the dev mode, open a new terminal session in your machine, go to the project folder and type the command ```make dev```.
* If you want to destroy the project, go to the terminal session in your machine where you've run ```make run``` and type de command ```make destroy```. IMPORTANT: you are running de application in terminal, you must type `EXIT` to exit de application and after that you can type ```make destroy```
