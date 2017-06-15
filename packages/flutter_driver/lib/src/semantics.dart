// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'message.dart';

/// Enables or disables semantics.
class SetSemantics extends Command {
  @override
  final String kind = 'set_semantics';

  /// Whether semantics should be enabled or disabled.
  final bool enabled;

  SetSemantics(this.enabled, { Duration timeout }) : super(timeout: timeout);

  /// Deserializes this command from the value generated by [serialize].
  SetSemantics.deserialize(Map<String, String> params)
      : this.enabled = params['enabled'].toLowerCase() == 'true',
        super.deserialize(params);

  @override
  Map<String, String> serialize() => super.serialize()..addAll(<String, String>{
    'enabled': '$enabled',
  });
}

/// The result of a [SetSemantics] command.
class SetSemanticsResult extends Result {
  SetSemanticsResult(this.changedState);

  final bool changedState;

  /// Deserializes this result from JSON.
  static SetSemanticsResult fromJson(Map<String, dynamic> json) {
    return new SetSemanticsResult(json['changedState']);
  }

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
    'changedState': changedState,
  };
}