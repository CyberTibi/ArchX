import QtQuick 2.0
import calamares.slideshow 1.0

Presentation {
    id: presentation
    property int slideDuration: 8000

    Timer {
        interval: presentation.slideDuration
        running: presentation.activatedInCalamares
        repeat: true
        onTriggered: presentation.goToNextSlide()
    }

    // ---------------------------
    // SLIDE 1
    // ---------------------------
    Slide {
        anchors.fill: parent

        Item {
            anchors.fill: parent
            opacity: 0.0
            Behavior on opacity { NumberAnimation { duration: 1200 } }
            Component.onCompleted: opacity = 1.0

            Image {
                source: "slide01.png"
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }

            Item {
                anchors.centerIn: parent
                width: parent.width * 0.9

                Rectangle {
                    id: bg1
                    anchors.centerIn: parent
                    width: text1.paintedWidth + 60
                    height: text1.paintedHeight + 40
                    radius: 12
                    color: "#80000000"
                }

                Text {
                    id: text1
                    text: "Welcome to ArchX Linux — fast, clean, and focused."
                    anchors.centerIn: parent
                    color: "#2eb398"
                    font.pixelSize: 24
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.Center
                    width: parent.width * 0.8
                }
            }
        }
    }

    // ---------------------------
    // SLIDE 2
    // ---------------------------
    Slide {
        anchors.fill: parent

        Item {
            anchors.fill: parent
            opacity: 0.0
            Behavior on opacity { NumberAnimation { duration: 1200 } }
            Component.onCompleted: opacity = 1.0

            Image {
                source: "slide02.png"
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }

            Item {
                anchors.centerIn: parent
                width: parent.width * 0.9

                Rectangle {
                    id: bg2
                    anchors.centerIn: parent
                    width: text2.paintedWidth + 60
                    height: text2.paintedHeight + 40
                    radius: 12
                    color: "#80000000"
                }

                Text {
                    id: text2
                    text: "A system that doesn’t get in your way — it just works."
                    anchors.centerIn: parent
                    color: "#2eb398"
                    font.pixelSize: 24
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.Center
                    width: parent.width * 0.8
                }
            }
        }
    }

    // ---------------------------
    // SLIDE 3
    // ---------------------------
    Slide {
        anchors.fill: parent

        Item {
            anchors.fill: parent
            opacity: 0.0
            Behavior on opacity { NumberAnimation { duration: 1200 } }
            Component.onCompleted: opacity = 1.0

            Image {
                source: "slide03.png"
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }

            Item {
                anchors.centerIn: parent
                width: parent.width * 0.9

                Rectangle {
                    id: bg3
                    anchors.centerIn: parent
                    width: text3.paintedWidth + 60
                    height: text3.paintedHeight + 40
                    radius: 12
                    color: "#80000000"
                }

                Text {
                    id: text3
                    text: "Lightning-fast startup with minimal resource usage."
                    anchors.centerIn: parent
                    color: "#2eb398"
                    font.pixelSize: 24
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.Center
                    width: parent.width * 0.8
                }
            }
        }
    }

    // ---------------------------
    // SLIDE 4
    // ---------------------------
    Slide {
        anchors.fill: parent

        Item {
            anchors.fill: parent
            opacity: 0.0
            Behavior on opacity { NumberAnimation { duration: 1200 } }
            Component.onCompleted: opacity = 1.0

            Image {
                source: "slide04.png"
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }

            Item {
                anchors.centerIn: parent
                width: parent.width * 0.9

                Rectangle {
                    id: bg4
                    anchors.centerIn: parent
                    width: text4.paintedWidth + 60
                    height: text4.paintedHeight + 40
                    radius: 12
                    color: "#80000000"
                }

                Text {
                    id: text4
                    text: "Arch-based, but stable and predictable."
                    anchors.centerIn: parent
                    color: "#2eb398"
                    font.pixelSize: 24
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.Center
                    width: parent.width * 0.8
                }
            }
        }
    }

    // ---------------------------
    // SLIDE 5
    // ---------------------------
    Slide {
        anchors.fill: parent

        Item {
            anchors.fill: parent
            opacity: 0.0
            Behavior on opacity { NumberAnimation { duration: 1200 } }
            Component.onCompleted: opacity = 1.0

            Image {
                source: "slide05.png"
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }

            Item {
                anchors.centerIn: parent
                width: parent.width * 0.9

                Rectangle {
                    id: bg5
                    anchors.centerIn: parent
                    width: text5.paintedWidth + 60
                    height: text5.paintedHeight + 40
                    radius: 12
                    color: "#80000000"
                }

                Text {
                    id: text5
                    text: "Simple installation, clear structure, modern experience."
                    anchors.centerIn: parent
                    color: "#2eb398"
                    font.pixelSize: 24
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.Center
                    width: parent.width * 0.8
                }
            }
        }
    }

    // ---------------------------
    // SLIDE 6
    // ---------------------------
    Slide {
        anchors.fill: parent

        Item {
            anchors.fill: parent
            opacity: 0.0
            Behavior on opacity { NumberAnimation { duration: 1200 } }
            Component.onCompleted: opacity = 1.0

            Image {
                source: "slide06.png"
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }

            Item {
                anchors.centerIn: parent
                width: parent.width * 0.9

                Rectangle {
                    id: bg6
                    anchors.centerIn: parent
                    width: text6.paintedWidth + 60
                    height: text6.paintedHeight + 40
                    radius: 12
                    color: "#80000000"
                }

                Text {
                    id: text6
                    text: "ArchX Linux: a system you stay in control of."
                    anchors.centerIn: parent
                    color: "#2eb398"
                    font.pixelSize: 24
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.Center
                    width: parent.width * 0.8
                }
            }
        }
    }
}
