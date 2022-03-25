import 'package:flutter/material.dart';

mostrarDialogDobleWidget(BuildContext context, String mensaje,
    {Function? fIzquierda,
    String mIzquierda: 'Acept',
    Function? fBotonIDerecha,
    String mBotonDerecha: 'CANCEL',
    String titulo: 'Message',
    Color color: Colors.redAccent,
    IconData icon: Icons.cancel}) {
  showGeneralDialog(
    barrierColor: Colors.black.withOpacity(0.5),
    transitionBuilder: (context, a1, a2, widget) {
      final curvedValue =
          Curves.fastLinearToSlowEaseIn.transform(a1.value) - 1.0;
      return Transform(
        transform:
            Matrix4.translationValues(curvedValue * 400.0, curvedValue, 0.0),
        child: Opacity(
          opacity: a1.value,
          child: AlertDialog(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(width: 0.0, color: Colors.black38)),
            title: Text(titulo.toString(), textAlign: TextAlign.center),
            content: Container(
              width: 350.0,
              child: Text(mensaje.toString()),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(mIzquierda),
                onPressed: () {
                  if (fIzquierda == null) {
                    Navigator.of(context).pop();
                  } else {
                    fIzquierda();
                  }
                },
              ),
              (fBotonIDerecha == null)
                  ? Container()
                  : ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                      label: Text(mBotonDerecha),
                      icon: Icon(icon, size: 18.0),
                      onPressed: () {
                        if (fBotonIDerecha == null) {
                          Navigator.of(context).pop();
                        } else {
                          fBotonIDerecha();
                        }
                      },
                    ),
            ],
          ),
        ),
      );
    },
    transitionDuration: Duration(milliseconds: 250),
    barrierDismissible: false,
    barrierLabel: '',
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return Container();
    },
  );
}

mostrarDialogSimpleWidget(BuildContext context, String mensaje,
    {Function? fBotonIDerecha,
      String mBotonDerecha: 'ACEPTAR',
      String titulo: 'Importante',
      Color color: Colors.redAccent,
      IconData icon: Icons.check}) {
  showGeneralDialog(
    barrierColor: Colors.black.withOpacity(0.5),
    transitionBuilder: (context, a1, a2, widget) {
      final curvedValue = Curves.fastLinearToSlowEaseIn.transform(a1.value) - 1.0;
      return Transform(
        transform: Matrix4.translationValues(curvedValue * 400.0, curvedValue, 0.0),
        child: Opacity(
          opacity: a1.value,
          child: AlertDialog(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide(width: 0.0, color: Colors.black38)),
            title: Text(titulo.toString(), textAlign: TextAlign.center),
            content: Container(
              width: 350.0,
              child: Text(mensaje.toString()),
            ),
            actions: <Widget>[
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(          
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
                label: Text(mBotonDerecha),
                icon: Icon(icon, size: 18.0),
                onPressed: () {
                  if (fBotonIDerecha == null) {
                    Navigator.of(context).pop();
                  } else {
                    fBotonIDerecha();
                  }
                },
              ),
            ],
          ),
        ),
      );
    },
    transitionDuration: Duration(milliseconds: 250),
    barrierDismissible: false,
    barrierLabel: '',
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return Container();
    },
  );
}
