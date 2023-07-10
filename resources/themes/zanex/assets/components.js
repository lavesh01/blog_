class Card {
  constructor() {
    this.element = document.createElement('div');
    this.element.classList.add('mb-3', 'card');
    this.header = new CardHeader();
    this.body = new CardBody();
    this.element.appendChild(this.header.element);
    this.element.appendChild(this.body.element);
  }
}

class CardHeader {
  constructor() {
    this.element = document.createElement('div');
    this.element.classList.add('card-header');
    this.status = new CardStatus();
    this.element.appendChild(this.status.element);
  }
}

class CardStatus {
  constructor() {
    this.element = document.createElement('div');
    this.element.classList.add('card-status', 'bg-blue', 'br-tr-7', 'br-tl-7');
  }
}

class CardBody {
  constructor() {
    this.element = document.createElement('div');
    this.element.classList.add('card-body');
    this.tabContent = new TabContent();
    this.element.appendChild(this.tabContent.element);
  }
}

class TabContent {
  constructor() {
    this.element = document.createElement('div');
    this.element.classList.add('tab-content');
    this.tableResponsive = new TableResponsive();
    this.element.appendChild(this.tableResponsive.element);
  }
}

class TableResponsive {
  constructor() {
    this.element = document.createElement('div');
    this.element.classList.add('table-responsive');
    this.divCommonDataTable = new DivCommonDataTable();
    this.element.appendChild(this.divCommonDataTable.element);
  }
}

class DivCommonDataTable {
  constructor() {
    this.element = document.createElement('div');
    this.element.setAttribute('id', 'div_common_dataTable');
    this.dataTable = new DataTable();
    this.element.appendChild(this.dataTable.element);
  }
}

class DataTable {
  constructor() {
    this.element = document.createElement('table');
    this.element.classList.add('table', 'table-hover', 'table-striped', 'sourced-data', 'dataTable');
    this.element.setAttribute('id', 'customrreportcharttypeview_dataTable');
  }
}

class anchorTagWithIcon {
  constructor() {
    this.anchorTag = document.createElement("a");
    this.anchorTag.setAttribute("href", "javascript:void(0);");
    this.anchorTag.setAttribute("class", "btn btn-secondary btn-sm");
    this.anchorTag.setAttribute("id", "add_user");
    
    this.anchorTag.appendChild(document.createTextNode(" Create New Campaign"));
  }
}

class icon {
  constructor() {
    this.icon = document.createElement("i");
    this.icon.setAttribute("class", "fa fa-plus-square icon-gradient bg-sunny-morning");
    this.icon.setAttribute("data-toggle", "tooltip");
    this.icon.setAttribute("title", "");
    this.icon.setAttribute("data-original-title", "Add New Campaign");
  }
}

class cardTopRightButton {
  constructor() {
    this.div = document.createElement('div');
    this.div.classList.add('btn-actions-pane-right', 'text-capitalize');
    this.anchorTagWithIcon = new anchorTagWithIcon();
    this.div.appendChild(this.anchorTagWithIcon.anchorTag);
  }
}

class CardWithDatatable {
  constructor() {
    this.card = document.createElement('div');
    this.card.classList.add('mb-3', 'card');

    this.cardContent = document.createElement('div');
    this.cardContent.classList.add('card-content');
    this.card.appendChild(this.cardContent);

    this.cardHeader = document.createElement('div');
    this.cardHeader.classList.add('card-header-tab', 'card-header-tab-animation', 'card-header');
    this.cardContent.appendChild(this.cardHeader);
    
    this.cardHeaderTitle = document.createElement('div');
    this.cardHeaderTitle.classList.add('card-header-title', 'font-size-lg', 'text-capitalize', 'font-weight-normal');
    this.cardHeader.appendChild(this.cardHeaderTitle);
    
    this.cardHeaderIcon = document.createElement('i');
    this.cardHeaderIcon.classList.add('header-icon', 'fa', 'fa-universal-access', 'icon-gradient', 'bg-love-kiss');
    this.cardHeaderTitle.appendChild(this.cardHeaderIcon);
    
    this.campaignText = document.createTextNode('Campaigns');
    this.cardHeaderTitle.appendChild(this.campaignText);
    
    this.cardBody = document.createElement('div');
    this.cardBody.classList.add('card-body', 'p-2');
    this.cardContent.appendChild(this.cardBody);
    
    this.table = document.createElement('table');
    this.table.classList.add('table', 'table-hover', 'table-striped', 'sourced-data', 'dataTable');
    this.table.setAttribute('id', 'common_dataTable');
    this.cardBody.appendChild(this.table);

    this.cardTopRightButton = new cardTopRightButton();
    this.cardHeader.appendChild(this.cardTopRightButton.div);
  }
}

const myCard = new CardWithDatatable();
document.body.appendChild(myCard.card);



