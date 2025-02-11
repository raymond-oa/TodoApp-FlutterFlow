import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'task_text_model.dart';
export 'task_text_model.dart';

class TaskTextWidget extends StatefulWidget {
  const TaskTextWidget({
    super.key,
    required this.tasksDoc,
    required this.checkAction,
  });

  final TasksRecord? tasksDoc;
  final Future Function()? checkAction;

  @override
  State<TaskTextWidget> createState() => _TaskTextWidgetState();
}

class _TaskTextWidgetState extends State<TaskTextWidget> {
  late TaskTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskTextModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await widget.tasksDoc!.reference.update(createTasksRecordData(
        completed: false,
      ));
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primaryText,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Theme(
                data: ThemeData(
                  checkboxTheme: const CheckboxThemeData(
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: CircleBorder(),
                  ),
                  unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                ),
                child: Checkbox(
                  value: _model.checkboxValue ??= widget.tasksDoc!.completed,
                  onChanged: (newValue) async {
                    safeSetState(() => _model.checkboxValue = newValue!);
                    if (newValue!) {
                      await widget.checkAction?.call();
                    } else {
                      await widget.checkAction?.call();
                    }
                  },
                  side: BorderSide(
                    width: 2,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  activeColor: FlutterFlowTheme.of(context).primary,
                  checkColor: FlutterFlowTheme.of(context).info,
                ),
              ),
              Flexible(
                child: Text(
                  valueOrDefault<String>(
                    widget.tasksDoc?.title,
                    'title',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
