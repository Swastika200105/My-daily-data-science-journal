#%%

import cv2
import time

face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')

cap = cv2.VideoCapture(0)
start_time = time.time()

while True:
    ret, frame = cap.read()

    if not ret:
        print("Failed to grab frame, exiting...")
        break

    frame = cv2.flip(frame, 1)
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(60, 60))

    i = 0
    for (x, y, w, h) in faces:
        cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 0), 2)
        i += 1
        cv2.putText(frame, 'face num' + str(i), (x - 10, y - 10),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 0, 255), 2)

    # Show total person count on screen
    cv2.putText(frame, f'People detected: {i}', (10, 30),
                cv2.FONT_HERSHEY_SIMPLEX, 0.8, (255, 0, 0), 2)

    cv2.imshow('frame', frame)
    cv2.waitKey(1)

    if time.time() - start_time > 10:
        print("10 seconds elapsed — releasing camera and closing window.")
        break

cap.release()
cv2.destroyAllWindows()


#%%
