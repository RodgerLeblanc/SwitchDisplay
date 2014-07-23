import my.library 1.0
import bb.cascades 1.2

    Container {
        Label {
            id: count
        }
        Container {
            id: display1
            visible: true
            Label {
                text: "First page"
            }
        } // end of display1 Container
        Container {
            id: display2
            visible: true
            topPadding: 100
            Label {
                text: "Second page"
            } 
        } // end of display2 Container
 //   } // end of main Container
    attachedObjects: [
        QTimer{    // Prettier but battery eater
            id : timer
            property double f : 0                               
            property double g : 0                               
            property int num1 : 5
            interval: 10
            onTimeout:{
                count.text = num1.toString()
                if (f < 1) {
                    f += 0.01;
                    display1.opacity = (1 - f);
                    display2.opacity = f;
                }
                else if (g < 1) {
                    g += 0.01;
                    display2.opacity = (1 - g);
                    display1.opacity = g;
                }
                else {
                    f = 0;
                    g = 0;
                    num1 -= 1;
                    if (num1 < 0) {
                        timer.stop();
                        num1 = 5;
                    	display1.opacity = 1;
                        display2.opacity = 1;
                        display2.visible = false;
                        timer2.start();
                    }
                }
            }  
        },
        QTimer{   // Simpler but battery conscious
            id : timer2
            property int num2 : 5                               
            interval: 2000
            onTimeout:{
                display1.visible = !display1.visible;
                display2.visible = !display2.visible;
                count.text = num2.toString()
                num2 -= 1;
                if (num2 < 0) {
                    timer2.stop();
                    num2 = 5;
                    display1.visible = true;
                    display2.visible = true;
                    timer.start();                    
                }
            }  
        }
    ] 
    onCreationCompleted: {
        timer.start();
    }
} // end of Page
