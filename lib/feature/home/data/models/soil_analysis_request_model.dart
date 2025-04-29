// soil_analysis_request_model.dart
import 'dart:io';

class SoilAnalysisRequest {
  final File? file;
  final double n;
  final int p;
  final int k;
  final double pH;
  final double ec;
  final int oc;
  final int s;
  final double zn;
  final double fe;
  final double cu;
  final double mn;
  final double b;

  SoilAnalysisRequest({
    this.file,
    required this.n,
    required this.p,
    required this.k,
    required this.pH,
    required this.ec,
    required this.oc,
    required this.s,
    required this.zn,
    required this.fe,
    required this.cu,
    required this.mn,
    required this.b,
  });

  SoilAnalysisRequest copyWith({
    File? file,
    double? n,
    int? p,
    int? k,
    double? pH,
    double? ec,
    int? oc,
    int? s,
    double? zn,
    double? fe,
    double? cu,
    double? mn,
    double? b,
  }) {
    return SoilAnalysisRequest(
      file: file ?? this.file,
      n: n ?? this.n,
      p: p ?? this.p,
      k: k ?? this.k,
      pH: pH ?? this.pH,
      ec: ec ?? this.ec,
      oc: oc ?? this.oc,
      s: s ?? this.s,
      zn: zn ?? this.zn,
      fe: fe ?? this.fe,
      cu: cu ?? this.cu,
      mn: mn ?? this.mn,
      b: b ?? this.b,
    );
  }
}