function asa266_test07 ( )

%*****************************************************************************80
%
%% TEST07 tests PPCHI2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 August 2010
%
%  Author:
%
%    John Burkardt
%
  nitest = 9;
  njtest = 9;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  PPCHI2 computes the percentage points\n' );
  fprintf ( 1, '  of the chi squared distribution.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  CDF, PPCHI2(CDF)\n' );
  fprintf ( 1, '\n' );

  for j = 1 : njtest

    v = j;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  For Chi^2 parameter value %f\n', v );
    fprintf ( 1, '\n' );

    for i = 1 : nitest

      cdf = i / ( nitest + 1 );
      [ x1, ifault ] = ppchi2 ( cdf, v );

      fprintf ( 1, '  %12f  %12f\n', cdf, x1 );

    end

  end

  return
end
