var xmlns = "http://www.w3.org/2000/svg",
  select = function(s) {
    return document.querySelector(s);
  },
  selectAll = function(s) {
    return document.querySelectorAll(s);
  },
 // container = select('.container'),
    ring = select('#ring')
  


//center the container cos it's pretty an' that
/*TweenMax.set(container, {
  position: 'absolute',
  top: '50%',
  left: '50%',
  xPercent: -50,
  yPercent: -50
})
*/
TweenMax.set('svg', {
  visibility:'visible'
})

TweenMax.set('#clickLineGroup line', {
  drawSVG:'40% 40%'
})

for(var i = 0; i < 3; i++){
  select('#radio' + i).radioId = i;
  select('#radio' + i).onclick = function(e){
    //console.log(e.target.radioId)
    var tl = new TimelineMax();
    tl.set('#clickLineGroup line', {
        drawSVG:'40% 40%'
      })
     .set('#clickLineGroup', {
        y:e.target.radioId * 75
      })
      .set(ring, {
      attr:{
        cy:e.target.getAttribute('cy'),
        rx:0,
        ry:0
      }
    })
      .to(ring, 1, {
      attr:{
        ry:22
      },
      ease:Elastic.easeOut.config(0.8, 0.6)
    })
      .to(ring, 0.8, {
      attr:{
        rx:22
      },
      ease:Elastic.easeOut.config(1.5, 0.79)
    },'-=1')
      
      .fromTo(e.target, 0.8, {
      attr:{
        r:4
      }
    },{
      attr:{
        r:12
      },
      ease:Elastic.easeOut.config(2.1, 0.9)
    },'-=1')
    .to('#clickLineGroup line', 0.4, {
      drawSVG:'40% 70%',
      ease:Linear.easeNone
},'-=1')
      .to('#clickLineGroup line', 0.4, {
        drawSVG:'100% 100%',
        ease:Linear.easeNone
},'-=0.6')
    
    
     tl.timeScale(1.2);
    
    TweenMax.set('text', {
      alpha:0.5
    })
    TweenMax.to(['#text' + e.target.radioId], 1, {
      alpha:1
    })  
     
  }//end loop
    
 
}


select('#radio0').onclick({target:select('#radio0')});