# ruby encoding: utf-8
PaymentMethod.create([
                         {name: 'Direct', sell_price: '100', method: 'direct' },
                         {name: 'Affiliate1', sell_price: '75', method: 'tiered' },
                         {name: 'Affiliate2', sell_price: '65', method: 'tiered' },
                         {name: 'Affiliate3', sell_price: '80', method: 'tiered' },
                         {name: 'Reseller1', sell_price: '75', method: 'flat' },
                         {name: 'Reseller2', sell_price: '85', method: 'flat' },
                     ])


Company.create([
                         {name: 'Owner (Direct Sale)', payment_method_id: 1},
                         {name: 'A Company', payment_method_id: 2},
                         {name: 'Another Company', payment_method_id: 3},
                         {name: 'Even More Company', payment_method_id: 4},
                         {name: 'Resell This', payment_method_id: 5},
                         {name: 'Sell More Things', payment_method_id: 6}
                        ])

