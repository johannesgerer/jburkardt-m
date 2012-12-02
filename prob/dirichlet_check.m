function check = dirichlet_check ( n, a )

%*****************************************************************************80
%
%% DIRICHLET_CHECK checks the parameters of the Dirichlet PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of components.
%
%    Input, real A(N), the probabilities for each component.
%    Each A(I) should be positive.
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  positive = 0;

  for i = 1 : n

    if ( a(i) <= 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'DIRICHLET_CHECK - Fatal error!\n' );
      fprintf ( 1, '  A(I) <= 0.\n' );
      fprintf ( 1, '  For I = %d\n', i );
      fprintf ( 1, '  A(I) = %f\n', a(i) );
      check = 0;
      return
    elseif ( 0.0 < a(i) )
      positive = 1;
    end

  end

  if ( ~positive )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIRICHLET_CHECK - Fatal error!\n' );
    fprintf ( 1, '  All parameters are zero!\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
