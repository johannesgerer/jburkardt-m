function n = rule_full_size ( degree )

%*****************************************************************************80
%
%% RULE_FULL_SIZE returns the full size of the requested quadrature rule.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    01 July 2014
%
%  Author:
%
%    John Burkardt.
%
%  Reference:
%
%    Hong Xiao, Zydrunas Gimbutas,
%    A numerical algorithm for the construction of efficient quadrature
%    rules in two and higher dimensions,
%    Computers and Mathematics with Applications,
%    Volume 59, 2010, pages 663-676.
%
%  Parameters:
%
%    Input, integer DEGREE, the degree of the quadrature (the 
%    maximum degree of the polynomials of two variables that are integrated
%    exactly.  1 <= DEGREE <= 20.
%
%    Output, integer N, the number of nodes in the full rule.
%
  n_save = [ ...
      1,   4,   4,   7,   7,  12,  12,  17,  17,  24, ...
     24,  33,  33,  44,  44,  55,  55,  68,  68,  81 ];

  if ( 1 <= degree & degree <= 20 )
    n = n_save(degree);
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RULE_FULL_SIZE - Fatal error!\n' );
    fprintf ( 1, '  Degree DEGREE must be between 1 and 20.\n' );
    error ( 'RULE_FULL_SIZE - Fatal error%' );
  end

  return
end