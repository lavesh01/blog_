<style>


        #menu {
           # overflow: auto;
            position:fixed;
            z-index:2;
        }

        .parent-menu {
            background-color: #0c8fff;
            min-width:200px;
            float:left;
        }

        #menu ul
        {
            list-style-type:none;
        }

        #menu ul li a
        {
            padding:10px 15px;
            display:block;
            color:#fff;
            text-decoration:none;
        }

            #menu ul li a:hover
            {
                background-color:#007ee9;
            }

            #menu ul li:hover > ul {
                left: 200px;
                -webkit-transition: left 200ms ease-in;
                -moz-transition: left 200ms ease-in;
                -ms-transition: left 200ms ease-in;
                transition: left 200ms ease-in;
            }

            #menu ul li > ul {
                position: absolute;
                background-color: #333;
                top: 0;
                left: -2000px;
                min-width: 200px;
                z-index: -1;
                height: 450px;
                -webkit-transition: left 200ms ease-in;
                -moz-transition: left 200ms ease-in;
                -ms-transition: left 200ms ease-in;
                transition: left 200ms ease-in;
                overflow: scroll;
                overflow-x: hidden;
            }

            #menu ul li > ul li a:hover
            {
                background-color:#2e2e2e;
            }
.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover {
    border: 1px solid #003eff;
    background: #007fff;
    font-weight: normal;
    color: #ffffff;
}

.draggable
{
    margin: 10px;
    box-shadow: 0px 0px 4px 0px rgba(0, 0, 0, 0.3);
}
.draggable:hover 
{

  -webkit-box-shadow:1px 1px 4px 4px rgba(0, 0, 0, 0.3);
  -moz-box-shadow: 1px 1px 4px 4px rgba(0, 0, 0, 0.3);
  box-shadow: 1px 1px 4px 4px rgba(0, 0, 0, 0.3);        

}
.ui-widget-content {
    background: #ececec;
}

.ui-accordion .ui-accordion-content {
padding: 0px;
}
    </style>
