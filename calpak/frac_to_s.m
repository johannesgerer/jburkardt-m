function s = frac_to_s ( f )

%*****************************************************************************80
%
%% FRAC_TO_S writes a positive fraction into a left justified character string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real F, the number to be written into the string.
%    F should be between 0.0 and 1.0.
%
%    Output, string S, a representation of F.
%
  if ( f < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FRAC_TO_S - Fatal error!\n' );
    fprintf ( 1, '  The input fraction F was negative:\n', f );
    error (  'FRAC_TO_S - Fatal error!' );
  elseif ( 1.0 <= f )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FRAC_TO_S - Fatal error!\n' );
    fprintf ( 1, '  The input fraction F = %g was 1 or more:\n', f );
    error (  'FRAC_TO_S - Fatal error!' );
  end

  s2 = sprintf ( '%f', f );

  s = s2[2:];

  return
end
