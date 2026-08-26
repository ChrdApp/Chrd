// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'package:google_fonts/google_fonts.dart';

class MultiSelectDropdownCopy extends StatefulWidget {
  const MultiSelectDropdownCopy({
    super.key,
    this.width,
    this.height,
    required this.dropdownTitle,
    required this.labelList,
    required this.optionList,
    required this.initialSelectedOptions,
    required this.dropdownText,
    this.onSelectionChanged,
  });

  final double? width;
  final double? height;
  final String dropdownTitle;
  final List<String> labelList;
  final List<String> optionList;
  final List<String> initialSelectedOptions;
  final String dropdownText;
  final Future Function(List<String>? value)? onSelectionChanged;

  @override
  State<MultiSelectDropdownCopy> createState() =>
      _MultiSelectDropdownCopyState();
}

class _MultiSelectDropdownCopyState extends State<MultiSelectDropdownCopy> {
  late List<String> _selectedOptions;
  final GlobalKey _dropdownKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    // Initialize selected options - handle both labels and option IDs
    _selectedOptions = _normalizeSelectedOptions(widget.initialSelectedOptions);

    // Automatically trigger callback with initial selected options
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_selectedOptions.isNotEmpty) {
        _handleSelectionChange(_selectedOptions);
      }
    });
  }

  @override
  void didUpdateWidget(MultiSelectDropdownCopy oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update if initial values change from parent
    if (oldWidget.initialSelectedOptions != widget.initialSelectedOptions) {
      setState(() {
        _selectedOptions =
            _normalizeSelectedOptions(widget.initialSelectedOptions);
      });

      // FIXED: Schedule callback for after build phase completes
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_selectedOptions.isNotEmpty) {
          _handleSelectionChange(_selectedOptions);
        }
      });
    }
  }

  // Normalize input - accepts either labels or option IDs and returns option IDs
  List<String> _normalizeSelectedOptions(List<String> input) {
    if (input.isEmpty) return [];

    List<String> normalized = [];

    for (String item in input) {
      // Check if item is already an option ID (exists in optionList)
      String itemStr = item.toString();
      if (widget.optionList.any((opt) => opt.toString() == itemStr)) {
        // It's already an option ID, use it directly
        normalized.add(itemStr);
      } else {
        // It might be a label, try to find its corresponding option ID
        int index = widget.labelList.indexOf(item);
        if (index != -1 && index < widget.optionList.length) {
          normalized.add(widget.optionList[index].toString());
        }
      }
    }

    return normalized;
  }

  void _handleSelectionChange(List<String> newOptionValues) {
    // Send the option IDs (not labels) to the callback
    if (widget.onSelectionChanged != null) {
      widget.onSelectionChanged!(newOptionValues);
    }
  }

  void _showOverlay() {
    final RenderBox renderBox =
        _dropdownKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    showDialog(
      context: context,
      barrierColor: Colors.black26,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return Stack(
            children: [
              // Dismiss overlay on tap outside
              Positioned.fill(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(color: Colors.transparent),
                ),
              ),
              // Overlay positioned below the dropdown
              Positioned(
                left: offset.dx,
                top: offset.dy + size.height - 1,
                width: size.width,
                child: Material(
                  elevation: 2.0,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  ),
                  child: Container(
                    constraints: const BoxConstraints(
                      maxHeight: 300,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).neutralDark900,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(12),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children:
                            List.generate(widget.labelList.length, (index) {
                          final label = widget.labelList[index];
                          final option = widget.optionList[index].toString();
                          final isSelected = _selectedOptions.contains(option);

                          return CheckboxListTile(
                            value: isSelected,
                            activeColor: Colors.white,
                            checkColor: Colors.black,
                            side: BorderSide(color: Colors.white, width: 2.0),
                            title: Text(
                              label,
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onChanged: (checked) {
                              // MULTI-SELECT: Add or remove from list
                              setDialogState(() {
                                if (checked == true) {
                                  // Add to selection if not already present
                                  if (!_selectedOptions.contains(option)) {
                                    _selectedOptions.add(option);
                                  }
                                } else {
                                  // Remove from selection
                                  _selectedOptions.remove(option);
                                }
                              });

                              // Update the main widget state
                              setState(() {});

                              // Send updated selection list to callback
                              _handleSelectionChange(
                                  List.from(_selectedOptions));
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String _getDisplayText() {
    // If no options selected, show hint text
    if (_selectedOptions.isEmpty) {
      return widget.dropdownText;
    }

    // Get labels for selected options (MULTIPLE)
    List<String> selectedLabels = [];
    for (int i = 0; i < widget.optionList.length; i++) {
      if (_selectedOptions.contains(widget.optionList[i].toString())) {
        selectedLabels.add(widget.labelList[i]);
      }
    }

    // Join ALL selected labels with comma
    return selectedLabels.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _dropdownKey,
      height: widget.height ?? 58.0,
      width: widget.width ?? double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).neutralDark900,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.transparent,
          width: 0.0,
        ),
      ),
      child: InkWell(
        onTap: _showOverlay,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  _getDisplayText(),
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
