function [ M, N, b ] = split ( A, b, w, flag )

%% SPLIT splits a matrix.
%
%  Discussion:
%
%    This routine is used by the JACOBI, SOR and GS routines.
%
%  Modified:
%
%    02 April 2006
%
%  Reference:
%
%    Richard Barrett, Michael Berry, Tony Chan, James Demmel,
%      June Donato, Jack Dongarra, Victor Eijkhout, Roidan Pozo,
%      Charles Romine, Henk van der Vorst
%    Templates for the Solution of Linear Systems: Building Blocks for 
%      Iterative Methods, 
%    SIAM Publications, 1993.
%
%  Parameters:
%
%    Input, real A(N,N), the system matrix.
%
%    Input, real B(N), the right hand side.
%
%    Input, real W, the relaxation parameter.
%    Only needed for SOR method.  Nominally 1 for GS method.
%
%    Input, integer FLAG, picks the method.
%    * 1: Jacobi method;
%    * 2: SOR method.
%    * 3: GS method.
%
%    Output, real M(N,N), N(N,N), matrices such that A = M - N.
%
%    Output, real B(N), the right hand side vector, which is modified
%    when the SOR method is being used.
%

%
%  JACOBI splitting.
%
  if ( flag == 1 )

    M = diag ( diag ( A ) );
    N = diag ( diag ( A ) ) - A;
%
%  SOR splitting.
%
  elseif ( flag == 2 )

    b = w * b;
    M =  w * tril ( A, -1 ) + diag ( diag ( A ) );
    N = -w * triu ( A,  1 ) + ( 1.0 - w ) * diag ( diag ( A ) );
%
%  GS splitting.
%
  elseif ( flag == 3 )

    M =  tril ( A, -1 ) + diag ( diag ( A ) );
    N = -triu ( A,  1 );

  end

  return
end
