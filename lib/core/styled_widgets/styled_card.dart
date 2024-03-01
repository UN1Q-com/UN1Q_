// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/styled_widgets/buttons/icon_buttons/styled_icon_button.dart';
import 'package:un1que_new/core/styled_widgets/text/heading/heading6/heading6_bold.dart';
import 'package:un1que_new/core/theme/constants.dart';

import 'buttons/filled_buttons/info_filled_button.dart';
import 'text/body/body2/body2_regular.dart';

class StyledCard extends StatefulWidget {
  const StyledCard({
    required this.active,
    required this.color,
    required this.onTap,
    this.dropdown,
    this.onLearnMorePressed,
    this.radius = ThemeBorderRadius.lg,
    this.showLearnMore = true,
    this.subtitle,
    this.subtitleWidget,
    this.title,
    super.key,
  });
  final bool active;
  final Color color;
  final List<String>? dropdown;
  final void Function()? onLearnMorePressed;
  final void Function() onTap;
  final double radius;
  final bool showLearnMore;
  final String? subtitle;
  final String? title;
  final Widget? subtitleWidget;

  @override
  State<StyledCard> createState() => _StyledCardState();
}

class _StyledCardState extends State<StyledCard> {
  bool showDropdown = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          color: widget.active ? ThemeColors.primary : widget.color,
        ),
        padding: const EdgeInsets.fromLTRB(
          ThemeSpacing.md,
          ThemeSpacing.md,
          ThemeSpacing.md,
          ThemeSpacing.md,
        ),
        child: widget.subtitleWidget != null
            ? widget.subtitleWidget!
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.subtitle == null && !widget.showLearnMore)
                    const SizedBox(height: ThemeSpacing.sm),
                  Row(
                    mainAxisAlignment: widget.subtitle == null
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextHeading6Bold(
                          widget.title!,
                          color: widget.active
                              ? ThemeColors.white
                              : ThemeColors.primary,
                        ),
                      ),
                      if (widget.dropdown != null)
                        StyledIconButton(
                          icon: showDropdown
                              ? Icons.keyboard_arrow_up_outlined
                              : Icons.keyboard_arrow_down_outlined,
                          color: ThemeColors.transparent,
                          iconColor: widget.active
                              ? ThemeColors.white
                              : ThemeColors.primary,
                          onPress: () {
                            setState(() {
                              showDropdown = !showDropdown;
                            });
                          },
                        ),
                    ],
                  ),
                  if (widget.subtitle != null)
                    const SizedBox(height: ThemeSpacing.xs),
                  if (widget.subtitle != null)
                    TextBody2Regular(
                      widget.subtitle!,
                      color: widget.active
                          ? ThemeColors.white
                          : ThemeColors.primary,
                    ),
                  AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    reverseDuration: const Duration(milliseconds: 50),
                    child: showDropdown
                        ? Padding(
                            padding:
                                const EdgeInsets.only(top: ThemeSpacing.xs),
                            child: Column(
                              key: const Key('showDropdown'),
                              children: [
                                for (final content in widget.dropdown!)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: ThemeSpacing.xs,
                                    ),
                                    child: TextBody2Regular(
                                      content,
                                      color: widget.active
                                          ? ThemeColors.white
                                          : ThemeColors.primary,
                                    ),
                                  ),
                              ],
                            ),
                          )
                        : const SizedBox(key: Key('hideDropdown')),
                  ),
                  if (widget.showLearnMore)
                    const SizedBox(height: ThemeSpacing.sm),
                  if (widget.showLearnMore)
                    Align(
                      alignment: Alignment.centerRight,
                      child: FilledInfoButton.text(
                        label: "Learn more", //context.l10n.learnMore,
                        height: ThemeButtonHeight.xs,
                        textColor: widget.active
                            ? ThemeColors.white
                            : ThemeColors.primary,
                        color: ThemeColors.transparent,
                        fontWeight: FontWeight.w600,
                        onPress: widget.onLearnMorePressed,
                      ),
                    ),
                  if (widget.subtitle == null && !widget.showLearnMore)
                    const SizedBox(height: ThemeSpacing.sm),
                ],
              ),
      ),
    );
  }
}
