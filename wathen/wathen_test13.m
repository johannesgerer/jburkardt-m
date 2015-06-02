function wathen_test13 ( )

%*****************************************************************************80
%
%% WATHEN_TEST13 uses SPY to display the sparsity of the Wathen matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 June 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WATHEN_TEST13\n' );
  fprintf ( 1, '  Display the sparsity of the Wathen matrix.\n' );
  for k = 1 : 6
    subplot ( 2, 3, k )
    nx = k;
    ny = k;
    n = wathen_order ( nx, ny );
    seed = 123456789;
    [ a, seed ] = wathen_davis ( nx, ny, n, seed );
    spy ( a )
  end
  suptitle ( 'WATHEN Matrix Sparsity Pattern' );

  filename = 'wathen_spy.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Graphics file saved as "%s"\n', filename );

  return
end

