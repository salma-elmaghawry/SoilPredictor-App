import 'dart:io';

class SoilAnalysisRequest {
  final File file;
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
    required this.file,
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

  
}