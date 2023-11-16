export interface PageComponent {
    name: string,
    id?:number,
    description: string,
    displayName?:string,
    fixed_postion?:string
}

export interface TreeNode {
  id: number;
  name: string;
  children?: TreeNode[];
  components?: Array<PageComponent>
  top_component?: PageComponent,
  bottom_component?: PageComponent
}

