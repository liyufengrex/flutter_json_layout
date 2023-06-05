abstract class CandidateConfig {
  static const candidateSuffix = ')';

  //- `isEmpty(a)` => a.isEmpty()
  static const candidateEmpty = 'isEmpty(';

  //- `isNotEmpty(a)` => a.isNotEmpty()
  static const candidateNotEmpty = 'isNotEmpty(';

  //- `equal(a, b)` => a == b
  static const candidateEqual = 'equal(';

  //- `lt(a, b)` => a < b
  static const candidateLt = 'lt(';

  //- `nlt(a, b)` => a <= b
  static const candidateNlt = 'nlt(';

  //- `gt(a, b)` => a > b
  static const candidateGt = 'gt(';

  //- `ngt(a, b)` => a >= b
  static const candidateNgt = 'ngt(';
}
