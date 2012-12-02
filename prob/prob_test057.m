function prob_test057 ( )

%*****************************************************************************80
%
%% TEST057 tests ERLANG_CDF, ERLANG_CDF_INV, ERLANG_PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST057\n' );
  fprintf ( 1, '  For the Erlang PDF:\n' );
  fprintf ( 1, '  ERLANG_CDF evaluates the CDF.\n' );
  fprintf ( 1, '  ERLANG_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  ERLANG_PDF evaluates the PDF.\n' );

  a = 1.0;
  b = 2.0;
  c = 3;

  check = erlang_check ( a, b, c );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST057 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );
  fprintf ( 1, '  PDF parameter B = %14f\n', b );
  fprintf ( 1, '  PDF parameter C = %6d\n', c );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = erlang_sample ( a, b, c, seed );

    pdf = erlang_pdf ( x, a, b, c );

    cdf = erlang_cdf ( x, a, b, c );

    x2 = erlang_cdf_inv ( cdf, a, b, c );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
