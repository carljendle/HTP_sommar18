function oct1 = merge(oct1,oct2,oct3,oct4,oct5,oct6,oct7,oct8)   
%oct1 = MERGE(oct1,oct2,oct3,oct4,oct5,oct6,oct7,oct8) 
%  This function merges 8 octrees into a single bigger octree. The first of
%  the 8 octrees metadata will be passed on to the merged octree.

   n = uint64(oct1.meta.N);
   % Increase size of the output octree
   oct1.meta.N = oct1.meta.N + 1;
   oct1.meta.original_matrix_size = [2.^[oct1.meta.N] 2.^[oct1.meta.N]...
                                    2.^[oct1.meta.N]];

   if (n ~= oct2.meta.N ||...
       n ~= oct3.meta.N ||...
       n ~= oct4.meta.N ||...
       n ~= oct5.meta.N ||...
       n ~= oct6.meta.N ||...
       n ~= oct7.meta.N ||...
       n ~= oct8.meta.N)
       error('Only possible to merge octrees of the same size');
   end
   
   oct1.adr = [oct1.adr(1:end-1),    ...
           oct2.adr(1:end-1)+1*8^n,    ...
           oct3.adr(1:end-1)+2*8^n,...
           oct4.adr(1:end-1)+3*8^n,...
           oct5.adr(1:end-1)+4*8^n,...
           oct6.adr(1:end-1)+5*8^n,...
           oct7.adr(1:end-1)+6*8^n,...
           oct8.adr(1:end  )+7*8^n];
    
    oct1.data = [oct1.data,...
            oct2.data,...
            oct3.data,...
            oct4.data,...
            oct5.data,...
            oct6.data,...
            oct7.data,...
            oct8.data];
        
end
