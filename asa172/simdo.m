function output = simdo ( qind, qfor, iprod, kdim, input )

%*****************************************************************************80
%
%% SIMDO generates multi-indices, simulating nested DO-loops.
%
%  Discussion:
%
%    The loops are assumed to be nested to a depth of K.
%
%    The R-th loop is assumed to have upper limit N(R) and increment Inc(R).
%
%    The total number of executions of the innermost loop is
%
%      N = product ( 1 <= R <= K ) N(R).
%
%    Let these executions be indexed by the single integer J, which
%    we call the index subscript.
%
%    Each value of J corresponds to a particular set of loop indices,
%    which we call the subscript vector I(J).
%
%    This routine can start with J and find I(J), or determine
%    J from I(J).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 July 2008
%
%  Author:
%
%    M O'Flaherty, G MacKenzie
%
%  Reference:
%
%    M O'Flaherty, G MacKenzie,
%    Algorithm AS 172:
%    Direct Simulation of Nested Fortran DO-LOOPS,
%    Applied Statistics,
%    Volume 31, Number 1, 1982, pages 71-74.
%
%  Parameters:
%
%    Input, logical QIND.
%    TRUE to convert an index subscript J to the subscript vector I(J).
%    FALSE to convert the subscript vector I(J) to the index subscript J.
%
%    Input, logical QFOR,
%    TRUE if conversion is required in standard Fortran subscripting order,
%    FALSE otherwise.
%
%    Input, integer IPROD(KDIM), contains the partial products.
%    If QFOR is FALSE, then
%      IPROD(S) = product ( 1 <= R <= S ) N(R).
%    If QFOR is TRUE, then
%      IPROD(S) = product ( 1 <= R <= S ) N(KDIM+1-R).
%
%    Input, integer KDIM, the nesting depth of the loops.
%
%    Input/output, integer JSUB.
%    If QIND is TRUE, then JSUB is an input quantity, an index subscript J
%    to be converted into the subscript vector I(J).
%    If QIND is FALSE, then JSUB is an output quantity, the index subscript J
%    corresponding to the subscript vector I(J).
%
%    Input/output, integer IVEC(KDIM).
%    if QIND is TRUE, then IVEC is an output quantity, the subscript vector I(J)
%    corresponding to the index subscript J.
%    If QIND is FALSE, then IVEC is an input quantity, a subscript vector I(J)
%    for which the corresponding index subscript J is to be computed.
%
  ifault = 0;
%
%  Index subscript to subscript vector conversion.
%
  if ( qind )

    jsub = input;

    if ( iprod(kdim) < jsub )
      ifault = 1;
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SIMDO - Fatal error!\n' );
      fprintf ( 1, '  JSUB exceeds limit.\n' );
      error ( 'SIMDO - Fatal error!' );
    end

    itempv = jsub - 1;

    for i = 1 : kdim - 1
      ik = kdim - i;
      ivec(i) = floor ( itempv / iprod(ik) );
      itempv = itempv - iprod(ik) * ivec(i);
      ivec(i) = ivec(i) + 1;
    end

    ivec(kdim) = itempv + 1;
    if ( qfor )
      ivec(1:kdim) = ivec(kdim:-1:1);
    end

    output = ivec;
%
%  Subscript vector to index subscript conversion.
%
  else

    ivec = input;

    if ( ~qfor )
      ivec(1:kdim) = ivec(kdim:-1:1);
    end

    if ( iprod(1) < ivec(1) )
      ifault = 2;
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SIMDO - Fatal error!\n' );
      fprintf ( 1, '  Illegal entry in IVEC.\n' );
      error ( 'SIMDO - Fatal error!' );
    end

    for i = 2 : kdim
      if ( iprod(i) / iprod(i-1) < ivec(i) )
        ifault = 2;
        fprintf ( 1, '\n' );
        fprintf ( 1, 'SIMDO - Fatal error!\n' );
        fprintf ( 1, '  Illegal entry in IVEC.\n' );
        fprintf ( 1, '  IPROD(%d) = %d\n', i, iprod(i) );
        fprintf ( 1, '  IPROD(%d) = %d\n', i-1, iprod(i-1) );
        fprintf ( 1, '  IVEC(%d)  = %d\n', i, ivec(i) );
        error ( 'SIMDO - Fatal error!' );
      end
    end

    jsub = ivec(1);

    for i = 2 : kdim
      jsub = jsub + ( ivec(i) - 1 ) * iprod(i-1);
    end
%
%  As a courtesy to the caller, UNREVERSE the IVEC vector
%  if you reversed it.  Doesn't matter in MATLAB since the
%  vector is input only.
%
%   if ( ~qfor )
%     ivec(1:kdim) = ivec(kdim:1:-1)
%   end

    output = jsub;

  end

  return
end
