function prob_test0565 ( )

%*****************************************************************************80
%
%% TEST0565 tests ENGLISH_WORD_LENGTH_CDF, ENGLISH_WORD_LENGTH_CDF_INV and ENGLISH_WORD_LENGTH_PDF.
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
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0565\n' );
  fprintf ( 1, '  For the English Word Length PDF:\n' );
  fprintf ( 1, '  ENGLISH_WORD_LENGTH_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  ENGLISH_WORD_LENGTH_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  ENGLISH_WORD_LENGTH_PDF evaluates the PDF;\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = english_word_length_sample ( seed );

    pdf = english_word_length_pdf ( x );

    cdf = english_word_length_cdf ( x );

    x2 = english_word_length_cdf_inv ( cdf );

    fprintf ( 1, '  %12d  %12f  %12f  %12d\n', x, pdf, cdf, x2 );

  end

  return
end
