import speech_recognition
import pyttsx3
import os
from datetime import date
from datetime import datetime
robot_mouth=pyttsx3.init()
robot_ear=speech_recognition.Recognizer()
robot_brain=""
count=0

while True:
    os.system('cls')
    with speech_recognition.Microphone() as mic:
        print("Robot: I'm listening")
        print("...")
        audio=robot_ear.listen(mic)
    print("Robot...")

    try:
        you=robot_ear.recognize_google(audio)
    except:
        you=""
        count+=count
        if count==3:
            count=0
            print("Fail")
            exit()
    if you=="":
        robot_brain="I can't hear you, please say loudly"
    elif you=="hello":
        robot_brain="Hello Long"
    elif you=="today":
        today=date.today()
        robot_brain=today.strftime("%B %d, %Y")
    elif you=="what time is this":
        now=datetime.now()
        robot_brain=now.strftime("%H hours %M minutes %S second")
    elif you=="how are you":
        robot_brain="I'm fine, thanks"
    elif you=="bye":
        robot_brain="Ok, See you later"
        robot_mouth.say(robot_brain)
        robot_mouth.runAndWait()
        exit()
    else:
        robot_brain="you don't say anything"

    print("robot: ",robot_brain)
    robot_mouth.say(robot_brain)
    robot_brain=""
    robot_mouth.runAndWait()