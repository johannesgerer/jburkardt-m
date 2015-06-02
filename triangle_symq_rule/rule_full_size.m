function npts = rule_full_size ( mmax )

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
%    Output, integer NPTS, the number of nodes in the full rule.
%
  nnodes = [ ...
      1,   3,   6,   6,   7,  12,  15,  16,  19,  25, ...
     28,  33,  37,  42,  49,  55,  60,  67,  73,  79, ...
     87,  96, 103, 112, 120, 130, 141, 150, 159, 171, ...
    181, 193, 204, 214, 228, 243, 252, 267, 282, 295, ...
    309, 324, 339, 354, 370, 385, 399, 423, 435, 453 ];

  if ( 1 <= mmax & mmax <= 50 )
    npts = nnodes(mmax);
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RULE_FULL_SIZE - Fatal error!\n' );
    fprintf ( 1, '  Degree MMAX must be between 1 and 50.\n' );
    error ( 'RULE_FULE_SIZE - Fatal error!' );
  end

  return
end

