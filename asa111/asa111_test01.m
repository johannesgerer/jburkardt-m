function asa111_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests PPND.
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
  fprintf ( 1, '  PPND computes percentage points of the normal distribution.\n' );
  fprintf ( 1, '  Compare to tabulated values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         CDF      X                         X  ' );
  fprintf ( 1, '                    DIFF\n' );
  fprintf ( 1, '               (tabulated)                 (PPND)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = normal_01_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    [ x2, ifault ] = ppnd ( fx );
    
    fprintf ( 1, '  %10.4e  %24.16e  %24.16e  %10.4e\n', ...
    fx, x, x2, abs ( x - x2 ) );

  end

  return
end
