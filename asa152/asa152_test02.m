function asa152_test02 ( )

%*****************************************************************************80
%
%% TEST02 demonstrates the use of CHYPER for point probabilities.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02:\n' );
  fprintf ( 1, '  CHYPER computes point probabilities\n' );
  fprintf ( 1, '  of the hypergeometric PDF.\n' );
  fprintf ( 1, '  Compare to tabulated values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   SAM   SUC   POP     X    ' );
  fprintf ( 1, '  PDF                       PDF                     DIFF\n' );
  fprintf ( 1, '                            ' );
  fprintf ( 1, ' (tabulated)               (CHYPER)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, sam, suc, pop, x, fx ] = hypergeometric_pdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    point = 1;

    [ fx2, ifault ] = chyper ( point, sam, x, pop, suc );

    fprintf ( 1, '  %4d  %4d  %4d  %4d  %24.16e  %24.16e  %10.4e\n', ...
    sam, suc, pop, x, fx, fx2, abs ( fx - fx2 ) );

  end

  return
end
