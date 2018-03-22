function commands=Gesture2Command(Gesture,commands)

    switch Gesture
        case 'Both Hands'
            commands(5)=1;
        case 'Right Hand'
            commands(6)=1;
        case 'Left Hand'
            commands(7)=1;
        case 'Red Light'
            commands(8)=1;
        case 'Green Light'
            commands(9)=1;
    end
            