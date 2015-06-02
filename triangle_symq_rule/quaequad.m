function [ zs, whts ] = quaequad ( itype, mmax )

%*****************************************************************************80
%
%% QUAEQUAD returns a symmetric quadrature formula for a reference triangle.
%
%  Discussion:
%
%    This routine constructs (or rather, retrieves)
%    D_3 symmetric quadrature formulae for smooth functions
%    on the triangle with vertices
%      (-1,-1/sqrt(3)), (1,-1/sqrt(3)), (0,2/sqrt(3)).
%
%    All quadratures are obtained to the extended precision.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    28 June 2014
%
%  Author:
%
%    Original FORTRAN77 version by Hong Xiao, Zydrunas Gimbutas.
%    This MATLAB version by John Burkardt.
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
%    Input, integer ITYPE, the configuration of the quadrature nodes.
%    * 0, all nodes on the reference triangle
%    * 1, quadrature nodes on the bottom 1/3 of the reference triangle
%    * 2, quadrature nodes on lower-left 1/6 of the reference triangle
%
%    Input, integer MMAX, the degree of the quadrature (the maximum degree of
%    the polynomials of two variables that are integrated
%    exactly. 1 <= MMAX <= 50.
%
%    Output, real ZS(2,NUMNODES), the nodes.
%
%    Output, real WHTS(NUMNODES), the weights.
%
%    Input, integer NUMNODES, the number of nodes in the quadrature rule.
%
  if ( mmax < 1 | 50 < mmax )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'QUAEQUAD - Fatal error!\n' );
    fprintf ( 1, '  1 <= MMAX <= 50 is required.\n' );
    error ( 'QUAEQUAD - Fatal error!' );
  end

  if ( itype < 0 | 2 < itype )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'QUAEQUAD - Fatal error!\n' );
    fprintf ( 1, '  0 <= ITYPE <= 2 is required.\n' );
    error ( 'QUAEQUAD - Fatal error!' );
  end
%
%  Retrieve the compressed rule.
%
  kk = rule_compressed_size ( mmax );
  [ xnew, ynew, whts ] = quaequad0 ( mmax, kk );

  nptsout = kk;
%
%  Expand the nodes to the entire triangle.
%
  if ( itype == 0 )

    [ nptsout, xsout, ysout, wsout ] = quaenodes ( kk, xnew, ynew, whts );

    [ zs, whts ] = quaecopy ( xsout, ysout, wsout, nptsout );
%
%  Expand the nodes to the lower 1/3 of the triangle.
%
  elseif ( itype == 1 )

    [ nptsout, xsout, ysout, wsout ] = quaenodes2 ( kk, xnew, ynew, whts );

    [ zs, whts ] = quaecopy ( xsout, ysout, wsout, nptsout );
%
%  Simply copy the nodes; they are already in the lower-left
%  1/6 of the triangle.
%
  elseif ( itype == 2 )
    [ zs, whts ] = quaecopy ( xnew, ynew, whts, nptsout );
  end

  return
end
