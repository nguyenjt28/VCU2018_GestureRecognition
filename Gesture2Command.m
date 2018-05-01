function commands=Gesture2Command(Gesture,commands)

    switch Gesture
        case 'LeftHand'
            commands(6)=1;
        case 'RightHand'
            commands(7)=1;
        case 'LeftHandUp'
            commands(8)=1;
        case 'RightHandUp'
            commands(9)=1;
        case 'Noise'
            commands(10)=1;
    end
            