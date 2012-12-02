function machar_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests R8_MACHAR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  R8_MACHAR computes double\n' );
  fprintf ( 1, '  precision machine constants.\n' );

  [ ibeta, it, irnd, ngrd, machep, negep, iexp, ...
    minexp, maxexp, eps, epsneg, xmin, xmax ] = r8_machar ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  IBETA is the internal base for machine arithmetic.\n' );
  fprintf ( 1, '    IBETA =  %d\n', ibeta );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  IT is the number of digits, base IBETA, in the\n' );
  fprintf ( 1, '  floating point significand.\n' );
  fprintf ( 1, '    IT =     %d\n', it );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  IRND reports on floating point addition rounding:\n' );
  fprintf ( 1, '  0, for chopping;\n' );
  fprintf ( 1, '  1, for non-IEEE rounding;\n' );
  fprintf ( 1, '  2, for IEEE rounding;\n' );
  fprintf ( 1, '  3, for chopping with partial underflow;\n' );
  fprintf ( 1, '  4, for non-IEEE rounding with partial underflow.\n' );
  fprintf ( 1, '  5, for IEEE rounding with partial underflow.\n' );
  fprintf ( 1, '    IRND =   %d\n', irnd );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  NGRD is the number of guard digits for floating point\n' );
  fprintf ( 1, '  multiplication with truncating arithmetic.\n' );
  fprintf ( 1, '    NGRD =   %d\n', ngrd );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  MACHEP is the largest negative integer such that\n' );
  fprintf ( 1, '  1.0 < 1.0 + BETA^MACHEP.\n' );
  fprintf ( 1, '    MACHEP = %d\n', machep );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  NEGEPS is the largest negative integer such that\n' );
  fprintf ( 1, '  1.0 - BETA^NEGEPS < 1.0:\n' );
  fprintf ( 1, '    NEGEP =  %d\n', negep );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  IEXP is the number of bits reserved for the exponent\n' );
  fprintf ( 1, '  of a floating point number:\n' );
  fprintf ( 1, '    IEXP =   %d\n', iexp );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  MINEXP is the most negative power of BETA such that\n' );
  fprintf ( 1, '  BETA^MINEXP is positive and normalized.\n' );
  fprintf ( 1, '    MINEXP = %d\n', minexp );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  MAXEXP is the smallest positive power of BETA that\n' );
  fprintf ( 1, '  overflows:\n' );
  fprintf ( 1, '    MAXEXP = %d\n', maxexp );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  EPS is a small positive floating point number\n' );
  fprintf ( 1, '  such that 1.0 < 1.0 + EPS.\n' );
  fprintf ( 1, '    EPS    = %26.16e\n', eps );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  EPSNEG is a small positive floating point number\n' );
  fprintf ( 1, '  such that 1.0 - EPSNEG < 1.0.\n' );
  fprintf ( 1, '    EPSNEG = %26.16e\n', epsneg );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  XMIN is the smallest positive normalized floating\n' );
  fprintf ( 1, '  point power of the radix:\n' );
  fprintf ( 1, '    XMIN =   %26.16e\n', xmin );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  XMAX is the largest finite floating point number:\n' );
  fprintf ( 1, '    XMAX   = %26.16e\n', xmax );

  return
end
