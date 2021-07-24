import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/enums/basic_dialog_status.dart';
import 'package:xyz_ui/xyz_ui.dart';

class BasicDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const BasicDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: _BasicDialogContent(
          request: request,
          completer: completer,
        ));
  }
}

class _BasicDialogContent extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _BasicDialogContent({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: screenWidthPercentage(context, percentage: 0.04),
          ),
          padding: const EdgeInsets.only(
            top: 32.0,
            left: 16.0,
            right: 16.0,
            bottom: 12.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: defaultBorderRadius,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              verticalSpaceSmall,
              BoxText.subheading(
                request.title ?? '',
                align: TextAlign.center,
              ),
              verticalSpaceSmall,
              BoxText.body(
                request.description ?? '',
                align: TextAlign.center,
              ),
              verticalSpaceMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  if (request.secondaryButtonTitle != null)
                    TextButton(
                      onPressed: () =>
                          completer(DialogResponse(confirmed: false)),
                      child: BoxText.body(
                        request.secondaryButtonTitle!,
                        color: Colors.black,
                      ),
                    ),
                  TextButton(
                    onPressed: () => completer(
                      DialogResponse(confirmed: true),
                    ),
                    child: BoxText.body(
                      request.mainButtonTitle ?? '',
                      color: kcPrimaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: -28.0,
          child: CircleAvatar(
            minRadius: 16.0,
            maxRadius: 28.0,
            backgroundColor: _getStatusColor(request.customData),
            child: Icon(
              _getStatusIcon(request.customData),
              size: 28.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(dynamic customData) {
    switch (customData) {
      case BasicDialogStatus.error:
        return kcRedColor;
      case BasicDialogStatus.warning:
        return kcOrangeColor;
      default:
        return kcPrimaryColor;
    }
  }

  IconData _getStatusIcon(dynamic customData) {
    switch (customData) {
      case BasicDialogStatus.error:
        return Icons.close;
      case BasicDialogStatus.warning:
        return Icons.warning_amber;
      default:
        return Icons.check;
    }
  }
}
