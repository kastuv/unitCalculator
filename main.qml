import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window
{
    width: 640;
    height: 480;
    visible: true;
    title: qsTr("Unit Calculator");
    color: "#222222";

    GridLayout
    {
        id: grid1
        columns: 2;
        anchors.centerIn: parent;
        columnSpacing: 10;
        rowSpacing: 10;

        Text {
            id: type;
            text: qsTr("Type :");
            color: "White";
        }

        ComboBox
        {
            id: option;
            implicitWidth: 105;
            implicitHeight: 30;

            model: ListModel
            {
                id: options
                ListElement
                {
                    text: "Inces to feet";
                }

                ListElement
                {
                    text: "Feet to inces";
                }
            }

            onActivated:
            {
                Value.convert(valueBox.text, option.currentIndex);
            }
        }

        //Row 2 starts here!!

        Text
        {
            id: value;
            text: qsTr("Value :");
            color: "White";
        }

        Rectangle
        {
            id: valueRect;
            width: 90;
            height: 20;
            color: "#555555";
            radius: 5;

            TextEdit
            {
                id: valueBox;
                anchors.fill: parent;
                anchors.verticalCenter: parent.verticalCenter
                text: "Enter your value..";
                font.pixelSize: 10;
                color: "White";
            }
        }

        //Row 3 starts here!

        Text
        {
            id: result;
            text: qsTr("Result :")
            color: "White";
        }

        Rectangle
        {
            id: resultRect;
            width: 90;
            height: 20;
            color: "#555555";
            radius: 5;

            Label
            {
                id: resultBox;
                anchors.fill: parent
                color: "White";
                text: Value.result.toFixed(3);
            }
        }
    }
}
