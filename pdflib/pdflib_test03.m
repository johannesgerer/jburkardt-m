function pdflib_test03 ( )

%*****************************************************************************80
%
%% PDFLIB_TEST03 calls R8_CHI_SAMPLE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 July 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PDFLIB_TEST03\n' );
  fprintf ( 1, '  R8_CHI_SAMPLE ( DF ) samples the Chi distribution with\n' );
  fprintf ( 1, '  DF degrees of freedom.\n' );
%
%  Initialize the package.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  INITIALIZE initializes the random number generator.\n' );
  fprintf ( 1, '  It only needs to be called once before using the package.\n' );

  initialize ( );
%
%  Set the current generator index to #2.
%
  g = 2;
  cgn_set ( g );
  fprintf ( 1, '\n' );
  fprintf ( 1,  '  Current generator index = %d\n', g );
%
%  Repeatedly call R8_CHI_SAMPLE ( DF ).
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I       DF       R8_CHI_SAMPLE ( DF )\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    df = 5.0 * r8_uniform_01_sample ( ) + 1.0;
    u = r8_chi_sample ( df );
    fprintf ( 1, '  %2d  %14g  %14g\n', i, df, u );
  end

  return
end