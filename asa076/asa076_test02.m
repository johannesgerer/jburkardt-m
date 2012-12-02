function asa076_test02 ( )

%*****************************************************************************80
%
%% TEST02 demonstrates the use of THA.
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
  fprintf ( 1, '  THA evaluates Owen''s T function.\n' );
  fprintf ( 1, '  Compare to tabulated values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '          H            A        ' );
  fprintf ( 1, 'T                         T\n' );
  fprintf ( 1, '                                ' );
  fprintf ( 1, '(Tabulated)               (THA)                   DIFF\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, h, a, t1 ] = owen_values ( n_data );

    if ( n_data == 0 )
      break
    end

    t2 = tha ( h, 1.0, a, 1.0 );

    fprintf ( 1, '  %12.8f  %12.8f  %24.16e  %24.16e  %10.4e\n', ...
    h, a, t1, t2, abs ( t1 - t2 ) );

  end

  return
end
