function residual ( )

%% RESIDUAL assembles the residual vector.
%
%  Modified:
%
%    26 April 2006
%
  global area
  global beta
  global difeta
  global fzero
  global indx
  global kappa
  global lambda1
  global lambda2
  global m
  global nel
  global neqn
  global nnodes
  global node
  global nq
  global nu1
  global nu2
  global nunk
  global xc
  global xl
  global xr

  resid = zeros(nunk*neqn,1 ); 
  xq = zeros(3);
  wq = zeros(3);
%
%  Set up quadrature information on [-1,1]
%
  [ xq, wq ] = gauss3pt;

  for it = 1 : nel

    for iq = 1 : nq

      x = xc(node(it,1)) + area(it) / 2.0 * ( xq(iq) + 1.0 );
      ar = area(it) * wq(iq);
%
%  Evaluate solutions at quadrature points.
%
      [ vh, vhx ] = eval_pt ( x, it, vcur ); 
      [ ch, chx ] = eval_pt ( x, it, ccur ); 
      [ fh, fhx ] = eval_pt ( x, it, fcur ); 
      [ etah, etahx ] = eval_pt ( x, it, etacur );
      [ vhold, vhxold ] = eval_pt ( x, it, vold ); 
      [ chold, chxold ] = eval_pt ( x, it, cold ); 
      [ fhold, fhxold ] = eval_pt ( x, it, fold ); 
      [ etahold, etahxold ] = eval_pt ( x, it, etaold );

      tauxovertau = tau_prob ( fh, fhx, ch, chx );

      for nuk = 1 : 4 

        for in = 1 : nnodes

          ip = node(it,in);
          i = indx(ip);

          if ( 0 < i )

            [ bb, bx ] = quadbf ( x, it, in, xc, node ); 

            term_linear = 0;
            term_nonlin = 0;

            if ( nuk == 1 )
              term_time = ( vh - vhold ) / dt; 
              term_nonlin = ( lambda1 * vh * etah ) / ( 1.0 + nu1 * vh );
            elseif ( nuk == 2 )
              term_time = ( ch - chold ) / dt;
              term_nonlin = -lambda1 * vh * etah / ( 1.0 + nu1 * vh );
            elseif ( nuk == 3 )
              term_time = ( fh - fhold ) / dt;
              term_nonlin = -beta * fh * ( fzero - fh ) * etah + ...
                lambda2 * ch * fh / ( 1.0 + nu2 * ch);
            elseif ( nuk == 4 )
              term_time = ( etah - etahold ) / dt;
              term_linear = difeta * bx * etah * ( etahx / etah - tauxovertau );
            end

            k = i + ( nuk - 1 ) * nunk;
            [rhs_source] = rhsfun_source ( x, time, bb, nuk );

            resid(k) = resid(k) + ( rhs_source  ...
              - ( term_time + term_nonlin ) * bb - term_linear ) * ar;
            
          end

        end

      end

    end       

  end 
%
%  Calculate norm of residual vector.
%
  resid_norm = sqrt ( resid' * resid ) / ( neqn * nunk )

  return
end
