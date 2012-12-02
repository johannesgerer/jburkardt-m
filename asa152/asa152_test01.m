function asa152_test01 ( )

%*****************************************************************************80
%
%% TEST01 demonstrates the use of CHYPER for cumulative probabilities.
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
  fprintf ( 1, 'TEST01:\n' );
  fprintf ( 1, '  CHYPER computes cumulative probabilities\n' );
  fprintf ( 1, '  of the hypergeometric PDF.\n' );
  fprintf ( 1, '  Compare to tabulated values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   SAM   SUC   POP     X    ' );
  fprintf ( 1, '  CDF                       CDF                     DIFF\n' );
  fprintf ( 1, '                            ' );
  fprintf ( 1, ' (tabulated)               (CHYPER)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, sam, suc, pop, x, fx ] = hypergeometric_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    point = 0;

    [ fx2, ifault ] = chyper ( point, sam, x, pop, suc );

    fprintf ( 1, '  %4d  %4d  %4d  %4d  %24.16e  %24.16e  %10.4e\n', ...
    sam, suc, pop, x, fx, fx2, abs ( fx - fx2 ) );

  end

  return
end
