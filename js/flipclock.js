
window.clockImages = [[], []];

for(var i=0; i<10; i++) {
    var img = new Image();
    img.src = cdn("img/clockU" + i + ".png");
    window.clockImages[0].push(img);
    img = new Image();
    img.src = cdn("img/clockD" + i + ".png");
    window.clockImages[1].push(img);
}

(function( $ ){

    var methods = {
        init : function(options) {
            
            var settings = {
                next: null,
                direction: 'both', // (up, down, jump, both)
                current: 0,
                target: 0,
                moving: false,
                halftime: 100
            };
            
            if(options) {
                $.extend(settings, options);
            }
            
            return this.each(function () {
                
                var $this = $(this);
                var data = $this.data('flipclock');
                
                if(!data) {
                    
                    $this.append('<div><img /></div>');
                    $this.append('<div><img /></div>');
                    
                    $this.data('flipclock', settings);
                    
                    $this.css({
                        position: 'relative',
                        width: '64px',
                        height: '96px',
                        'float': 'left'
                    });
                    
                    var divs = $this.find('div');
                    var imgs = $this.find('img');
                    
                    divs.css({
                        position: 'absolute',
                        top: '0px',
                        width: '64px',
                        height: '48px'
                    });
                    
                    divs.last().css({top: '48px'});
                    
                    imgs.css({
                        position: 'absolute',
                        visibility: 'hidden',
                        top: '0px',
                        width: '64px',
                        height: '48px'
                    });
                    
                    $this.flipclock("flip", 0);
                    
                }
                
            });
            
            
        },
        value: function () { return this.data('flipclock').target; },
        flip: function (n) {
            
            return this.each(function () {
                
                var $this = $(this);
                var data = $this.data('flipclock');
                
                data.target = n;
                
                if(data.moving) {
                    return ;
                }
                
                data.moving = true;
                
                if(data.next !== null) {
                    setTimeout(function (next, n) {
                        $(next).flipclock("flip", Math.floor(n / 10.0));
                    }, 1, data.next, n);
                }
                
                if(n > 9) {
                    n = n % 10;
                }
                
                var divs = $this.find('div');
                var imgs = $this.find('img');
                
                var done = function () {
                    
                    divs.first().css({"background-image": 'url(' + cdn('img/clockU' + n + '.png') + ')'});
                    divs.last().css({"background-image": 'url(' + cdn('img/clockD' + n + '.png') + ')'});
                    
                    imgs.css({visibility: 'hidden'});
                    
                    data.current = n;
                    data.moving = false;
                    
                    if(data.target % 10 != data.current) {
                        $this.flipclock("flip", data.target);
                    }
                    
                }
                
                if(n == data.current) {
                    
                    done();
                    return ;
                    
                }
                
                switch(data.direction) {
                    case 'jump': break;
                    case 'up':
                        n = (data.current + 1) % 10;
                        break;
                    case 'down':
                        n = (data.current + 9) % 10;
                        break;
                    case 'both':
                        var p = n - data.current;
                        if(Math.abs(p) <= 5) {
                            if(p < 0) {
                                n = (data.current - 1);
                            } else {
                                n = (data.current + 1);
                            }
                        } else {
                            if(p < 0) {
                                n = (data.current + 1) % 10;
                            } else {
                                n = (data.current + 9) % 10;
                            }
                        }
                        break;
                }
                
                if(n > data.current || (n < 3 && data.current > 6)) {
                    
                    divs.first().css({"background-image": 'url(' + cdn('img/clockU' + n + '.png') + ')'});
                    
                    imgs.first().attr('src', cdn('img/clockU' + data.current + '.png'));
                    imgs.first().css({visibility: 'visible', top: '0px', height: '49px'});
                    
                    imgs.first().animate({height: '0px', top: '48px'}, data.halftime, 'easeInCubic', function () {
                        
                        imgs.last().attr('src', cdn('img/clockD' + n + '.png'));
                        imgs.last().css({visibility: 'visible', height: '0px'});
                        imgs.last().animate({height: '48px'}, data.halftime, 'easeOutCubic', done);
                        
                    });
                    
                } else {
                    
                    divs.last().css({"background-image": 'url(' + cdn('img/clockD' + n + '.png') + ')'});
                    imgs.last().attr('src', cdn('img/clockD' + data.current + '.png'));
                    imgs.last().css({visibility: 'visible', height: '48px'});
                    
                    imgs.last().animate({height: '0px'}, data.halftime, 'easeInCubic', function () {
                        
                        imgs.first().attr('src', cdn('img/clockU' + n + '.png'));
                        imgs.first().css({visibility: 'visible', top: '48px', height: '0px'});
                        imgs.first().animate({top: '0px', height: '48px'}, data.halftime, 'easeOutCubic', done);
                        
                    });
                    
                }
                
            });
            
        }
    };
  
    $.fn.flipclock = function( method ) {
        
        // Method calling logic
        if ( methods[method] ) {
          return methods[ method ].apply( this, Array.prototype.slice.call( arguments, 1 ));
        } else if ( typeof method === 'object' || ! method ) {
          return methods.init.apply( this, arguments );
        } else {
          $.error( 'Method ' +  method + ' does not exist on jQuery.flipclock' );
          return null;
        }
        
    };

})( jQuery );
