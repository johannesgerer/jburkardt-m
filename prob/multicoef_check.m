function check = multicoef_check ( nfactor, factor )

%*****************************************************************************80
%
%% MULTICOEF_CHECK checks the parameters of the multinomial coefficient.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NFACTOR, the number of factors.
%    1 <= NFACTOR.
%
%    Input, integer FACTOR(NFACTOR), contains the factors.
%    0.0 <= FACTOR(I).
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  if ( nfactor < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MULTICOEF_CHECK - Fatal error!\n' );
    fprintf ( 1, '  NFACTOR < 1.\n' );
    check = 0;
    return
  end

  for i = 1 : nfactor

    if ( factor(i) < 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'MULTICOEF_CHECK - Fatal error!\n' );
      fprintf ( 1, '  Factor %d\n', i );
      fprintf ( 1, '  = %d\n', factor(i) );
      fprintf ( 1, '  But this value must be nonnegative.\n' );
      check = 0;
      return
    end

  end

  check = 1;

  return
end
