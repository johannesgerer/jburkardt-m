function npts = rule_compressed_size ( mmax )

%*****************************************************************************80
%
%% RULE_COMPRESSED_SIZE returns the compressed size of the requested quadrature rule.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    26 June 2014
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
%    Input, integer MMAX, the degree of the quadrature (the maximum degree of
%    the polynomials of two variables that are integrated
%    exactly.  1 <= MMAX <= 50.
%
%    Output, integer NPTS, the number of nodes in the compressed rule.
%
  nnodes = [ ...
     1,  1,  2,  2,  3, ...
     3,  4,  5,  6,  7, ...
     8,  8, 10, 10, 12, ...
    13, 13, 15, 17, 18, ...
    19, 20, 23, 24, 25, ...
    27, 29, 30, 32, 34, ...
    37, 39, 41, 44, 46, ...
    46, 49, 51, 54, 58, ...
    58, 62, 65, 67, 70, ...
    73, 75, 78, 82, 84 ];

  if ( 1 <= mmax & mmax <= 50 )
    npts = nnodes(mmax);
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RULE_COMPRESSED_SIZE - Fatal error!\n' );
    fprintf ( 1, '  Degree MMAX must be between 1 and 50.\n' );
    error ( 'RULE_COMPRESSED_SIZE - Fatal error!' );
  end

  return
end
