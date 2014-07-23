import my.library 1.0
import bb.cascades 1.2

Page {
    onCreationCompleted: {
        timer.start()
    }
    Container {
    	Container {
        	id: display1
        	visible: true
        	Label {
            	text: "This is the first page"
            }
        } // end of display1 Container
        Container {
        	id: display2
        	visible: true
        	topPadding: 100
        	Label {
            	text: "This is the second page"
            } 
        } // end of display2 Container
        ToggleButton {
            checked: false
            onCheckedChanged: {
                if (checked) {
                	timer.stop();
                	display1.opacity = 1;
                	display2.opacity = 1;
                	display2.visible = false;
                	timer2.start();
                }
                else {
                    timer2.stop();
                    display1.visible = true;
                    display2.visible = true;
                    timer.start();
                }
            }
        }
    } // end of main Container
    attachedObjects: [
        QTimer{
            id : timer
            property double f : 0                               
            property double g : 0                               
            property bool first : true
            interval: 10
            onTimeout:{
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
                }
            }  
        },
        QTimer{
            id : timer2
            interval: 2000
            onTimeout:{
                display1.visible = !display1.visible;
                display2.visible = !display2.visible;
            }  
        }
    ]} // end of Page
