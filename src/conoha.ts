import { Identity } from './service/identity';

export default class ConoHa {
  private _identity: Identity;

  // TODO: create http client and services with it
  constructor() {
  }

  get identity() {
    return this._identity;
  };
}
